class Station < ApplicationRecord
  validates_presence_of :name, :city, :dock_count, require: true

  has_many :trips

  def started_at
    Trip.where(start_station_id: id).count
  end 

  def ended_at
    Trip.where(end_station_id: id).count
  end 

  def popular_end_station
    trip = Trip.where(start_station_id: id).group(:end_station_id).count.max.first
    Station.find(trip).name
  end

  def popular_start_station
    trip = Trip.where(end_station_id: id).group(:start_station_id).count.max.first
    Station.find(trip).name
  end

  def popular_date
    Trip.where(start_station_id: id).group(:start_date).count.max.first
  end

  def popular_zip
    Trip.where(start_station_id: id).group(:zip_code).count.max.first
  end

  def popular_bike
    Trip.where(start_station_id: id).group(:bike_id).count.max.first
  end
end
