class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "Success!"
      redirect_to manufacturers_path
    else
      render :new
    end
  end

  def index
    @manufacturers = Manufacturer.all
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
