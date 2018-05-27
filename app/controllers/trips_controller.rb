class TripsController < ApplicationController
  before_action :set_trip, only: [:show]

  def show; end

  def index
    @trips = Trip.paginate(page: params[:page], per_page: 30)
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:duration, :start_date, :end_date,
                                   :start_station, :end_station, :bike_id,
                                   :subscription_type, :zip_code)
    end
end
