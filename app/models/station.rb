class Station < ApplicationRecord
  validates_presence_of :name, :city, :dock_count, require: true

  has_many :trips, dependent: :nullify






  def started_at
    Trip.where(start_station_id: id).count
  end 

  def ended_at
    Trip.where(end_station_id: id).count
  end 

  def popular_end_station
    return "None" if Trip.all == []
    trip = Trip.where(start_station_id: id).group(:end_station_id).count.max.first
    Station.find(trip).name
  end

  def popular_start_station
    return "None" if Trip.all == []
    trip = Trip.where(end_station_id: id).group(:start_station_id).count.max.first
    Station.find(trip).name
  end

  def popular_date
    return "None" if Trip.all == []
    Trip.where(start_station_id: id).group(:start_date).count.max.first
  end

  def popular_zip
    return "None" if Trip.all == []
    Trip.where(start_station_id: id).group(:zip_code).count.max.first
  end

  def popular_bike
    return "None" if Trip.all == []
    Trip.where(start_station_id: id).group(:bike_id).count.max.first
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
