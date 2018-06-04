class Admin::StationsController < Admin::BaseController
  # before_action :set_admin_station, only: [:edit, :update, :destroy]

  def new
    @admin = current_user
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
    @admin = current_user
    @station = Station.find_by(id: params[:id])
  end

  def update
    @station = Station.find(params[:id])
    @station.update(station_params)
    if @station.save
      flash[:success] = "#{@station.name} updated!"
      redirect_to "/station/#{@station.name}"
    else
      render :edit
    end
  end

  def destroy
    station = Station.find(params[:id])
    trips = Trip.where("end_station_id=? OR start_station_id=?", station.id, station.id)
    trips.each do |trip|
      trip.destroy
    end
    station.destroy

    flash[:success] = "#{station.name} was successfully deleted!"

    redirect_to stations_path
  end


  private
  def station_params
    params.require(:station).permit(:name, :city, :dock_count, :installation_date)
  end
end
