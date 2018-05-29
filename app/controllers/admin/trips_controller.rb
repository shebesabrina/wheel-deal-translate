class Admin::TripsController < Admin::BaseController
  before_action :set_admin_trip, only: [:show, :edit, :update, :destroy]

  def show; end

  def edit; end

  def new
    @trip = Trip.new
  end

  def index
    @trips = Trip.all
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, notice: 'Trip was successfully destroyed.'
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip), notice: 'Trip was successfully updated.'
    else
      render :edit
      flash[:notice] = 'Fill in all fields before submitting!'
    end
  end

  def create
    @admin = current_user
    @trip = @admin.trips.create(trip_params)
    if @trip.save
      redirect_to admin_trips_path
      flash[:notice] = 'Trip was successfully created.'
    else
      render :new
      flash[:notice] = 'Fill in all fields before submitting!'
    end
  end

  private

    def set_admin_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:duration, :start_date, :end_date,
                                   :start_station, :end_station, :bike_id,
                                   :subscription_type, :zip_code)
    end
end
