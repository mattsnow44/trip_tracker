class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @location = @trip.locations.new
    render partial: 'form'
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to @trip
    else
      render partial: 'form'
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @location.update(location_params)
      redirect_to @trip
    else
      render partial: 'form'
    end
  end

  def destroy
    @location.destroy
    redirect_to @trip
  end

  private

  def set_trip
    @trip = current_user.trips.find(params[:trip_id])
  end

  def set_location
    @location = @trip.locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
