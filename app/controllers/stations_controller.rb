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

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:success] = "You created #{@station.name}"
      redirect_to "/station/#{@station.name}"
    else
      render :new
    end
  end

  def edit
    @station = Station.find_by(id: params[:id])
  end

  def update
    @station = Station.find(params[:id])
    @station.update(station_params)
    if @station.save
      flash[:success] = "#{@station.name} updated!"
      redirect_to station_path(@station)
    else
      render :edit
    end
  end

  def destroy
    station = Station.find(station_params)
    binding.pry
    station.destroy

    flash[:success] = "#{station.name} was successfully deleted!"

    redirect_to stations_path
  end


  private
  def station_params
  params.require(:station).permit(:name, :city, :dock_count, :installation_date)
  end
end
