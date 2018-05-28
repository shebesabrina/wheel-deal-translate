class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @station = Station.find_by(name: params[:name])
  end


  private
  def station_params
  params.require(:station).permit(:name, :city, :dock_count, :installation_date)
  end
end