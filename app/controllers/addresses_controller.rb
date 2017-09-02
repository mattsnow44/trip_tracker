class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_trip
  # before_action :set_address

  
  def index
  end

  def new
    @address = @location.addresses.new
    render partial: 'form'
  end

  def create
    @address = @location.addresses.new(address_params)
    if @address.save
      redirect_to @location
    else
      render partial: 'form'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to @location
    else
      render partial: 'form'
    end
  end

  def edit
    render partial: 'form'
  end

  def destroy
    @address.destroy
    redirect_to @location
  end

  private

  def set_location
    @location = current_user.locations.find(params[:location_id])
  end

  # def set_address
  #   @address = @location.Addresss.find(params[:id])
  # end

  def address_params
    params.require(:address).permit(:name)
  end

end