class CarsController < ApplicationController
  def new
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = @manufacturer.cars.build
  end
  def create
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car = @manufacturer.cars.build(car_params)
    if @car.save
      flash[:notice] = 'Success!'
      redirect_to manufacturer_cars_path
    else
      render :new 
    end
  end

  def index
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @cars = @manufacturer.cars
  end

  def show
    @car = Car.find(params[:id])
  end


  private
  def car_params
    params.require(:car).permit(:name, :color, :year, :mileage, :description)
  end
end
