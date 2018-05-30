class Station < ApplicationRecord
  validates_presence_of :name, :city, :dock_count, require: true

  has_many :trips, dependent: :destroy

  def started_at
    Trip.where(start_station_id: id).count
  end

  def ended_at
    Trip.where(end_station_id: id).count
  end

  def popular_end_station
    trip = Trip.where(start_station_id: id).group(:end_station_id).count.max
    return "None" if trip == nil
    Station.find(trip.first).name
  end

  def popular_start_station
    trip = Trip.where(end_station_id: id).group(:start_station_id).count.max
    return "None" if trip == nil
    Station.find(trip.first).name
  end

  def popular_date
    trip = Trip.where(start_station_id: id).group(:start_date).count.max
    return "None" if trip == nil
    trip.first
  end

  def popular_zip
    trip = Trip.where(start_station_id: id).group(:zip_code).count.max
    return "None" if trip == nil
    trip.first
  end

  def popular_bike
    trip = Trip.where(start_station_id: id).group(:bike_id).count.max
    return "None" if trip == nil
    trip.first
  end

  def self.total_count
    Station.all.count
  end

  def self.average_bikes
    Station.average(:dock_count).to_i
  end

  def self.most_bikes
    Station.order('dock_count DESC').first
  end

  def self.top_stations_by_bike_count
    Station.order('dock_count DESC').slice(0, 3)
  end

  def self.bottom_stations_by_bike_count
    Station.order('dock_count ASC').slice(0, 3)
  end

  def self.newest_station
    Station.order('installation_date DESC').first.name
  end

  def self.oldest_station
    Station.order('installation_date ASC').first.name
  end
end
