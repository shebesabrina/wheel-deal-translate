class Trip < ApplicationRecord
  validates :duration,
            :start_date,
            :start_station,
            :end_date,
            :end_station,
            :bike_id,
            :subscription_type, presence: true
  
  has_many :trip_stations
  has_many :stations, through: :trip_stations

  def self.average_trip_duration
    Trip.average(:duration).to_i
  end

  def self.longest_duration
    Trip.maximum(:duration)
  end

  def self.shortest_duration
    Trip.minimum(:duration)
  end

  def self.most_ridden_bike
    Trip.group(:bike_id).count.sort.last
  end

  def self.least_ridden_bike
    Trip.group(:bike_id).count.sort[0]
  end

  def self.most_popular_date
    Trip.group(:start_date).count.sort.last
  end

  def self.least_popular_date
    Trip.group(:start_date).count.sort[0]
  end
end
