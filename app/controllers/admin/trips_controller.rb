class Admin::TripsController < Admin::BaseController
  before_action :set_admin_trip, only: [:edit, :update, :destroy]

  def edit
    @start_station_names = Trip.start_station_names
    @end_station_names   = Trip.end_station_names
    @subscription_types  = Trip.subscription_types
  end

  def new
    @trip = Trip.new
    @start_station_names = Trip.start_station_names
    @end_station_names   = Trip.end_station_names
    @subscription_types  = Trip.subscription_types
  end

  def destroy
    @trip.destroy
    flash[:notice] = 'Trip was successfully destroyed.'
    redirect_to trips_path
  end

  def update
    if @trip.update(trip_params)
      flash[:notice] = 'Trip was successfully updated.'
      redirect_to trip_path(@trip)
    else
      flash[:notice] = 'Fill in all fields before submitting, or ensure Station ID is valid!'
      render :edit
    end
  end

  def create
    @admin = current_user
    @trip = Trip.create(trip_params)
    if @trip.save
      flash[:notice] = 'Trip was successfully created.'
      redirect_to trip_path(@trip)
    else
      flash[:notice] = 'Fill in all require fields, and make sure your Station ID is valid!'
      render :new
    end
  end

  private

    def set_admin_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:duration, :start_date, :end_date,
                                   :start_station_id, :end_station_id, :bike_id,
                                   :subscription_type, :zip_code)
    end
end
