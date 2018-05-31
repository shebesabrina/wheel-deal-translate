class Trip < ApplicationRecord
  validates :duration,
            :start_date,
            :start_station,
            :end_date,
            :end_station,
            :bike_id,
            :subscription_type, presence: true

  belongs_to :start_station, class_name: "Station"
  belongs_to :end_station, class_name: "Station"
  # has_one :start_station_id, class_name: 'Station', foreign_key: 'station_id', dependent: :destroy
  # has_one :end_station_id, class_name: 'Station', foreign_key: 'station_id', dependent: :destroy

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
    Trip.group(:bike_id).count.max
  end

  def self.least_ridden_bike
    Trip.group(:bike_id).count.min
  end

  def self.most_popular_date
    Trip.group(:start_date).count.max
  end

  def self.least_popular_date
    Trip.group(:start_date).count.min
  end

  def self.subscription_type_counts
    Trip.group(:subscription_type).count
  end

  def self.subscription_type_percents
    type_counts = Trip.subscription_type_counts
    total = type_counts.values.sum
    type_counts.transform_values do |value|
      (value * 100.0 / total).round(2)
    end.sort
  end

  def self.subscription_type_breakdown
    type_percents = Trip.subscription_type_percents
    Trip.subscription_type_counts.values.sort.zip(type_percents)
  end
end
