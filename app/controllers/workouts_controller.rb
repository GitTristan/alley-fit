class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
    @clients = Client.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workout_path(@workout), notice: 'Workout created successfully!'
    else
      render :new
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @client = @workout.client
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      flash[:notice] = "Workout updated successfully!"
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end

  def destroy
   workout = Workout.find(params[:id])
   workout.destroy
   flash[:notice] = "Deleted Workout"
   redirect_to workouts_path
  end


    private

    def client_params
      params.require(:workout).permit(:date, :time, :workout, :coments)
    end
end