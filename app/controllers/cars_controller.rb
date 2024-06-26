class CarsController < ApplicationController
  def index
    @cars = Car.all
    @car = Car.new
  end

  def show
    @car = Car.find(params[:id])
    @rental = Rental.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :car_type, :transmission, :price, :car_description, :photo)
  end
end
