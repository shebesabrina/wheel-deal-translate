class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def dashboard
    @stations_count = Station.total_count
    @average_num_bikes = Station.average_bikes
    @station_with_most_bikes = Station.most_bikes
    @stations_with_most_bikes = Station.top_stations_by_bike_count
    @stations_with_least_bikes = Station.bottom_stations_by_bike_count
    @most_recent_station = Station.newest_station
    @oldest_installed_station = Station.oldest_station
  end

  def show
    @station = Station.find_by(name: params[:name])
  end


  private
  def station_params
  params.require(:station).permit(:name, :city, :dock_count, :installation_date)
  end
end
