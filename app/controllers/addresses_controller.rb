class AddressesController < ApplicationController
  require 'pry'
  # before_action :set_trip
  before_action :set_location
  before_action :set_address, only: [:update, :edit, :destroy]


  def index
  end

  def new
    @address = Address.new
    render partial: 'form'
  end

  def create
    @address = @location.create_address(address_params)
    if @address.save
      redirect_to trip_location_path(@location.trip[:id], @location)
    else
      render partial: 'form'
    end
  end


  def edit
    render partial: 'form'
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_path(@location.trip[:id], @location)
    else
      render partial: 'form'
    end
  end

  def destroy
    @address.destroy
    redirect_to @location
  end


  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip, :location_id)
  end

end
