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

  def self.average_trip_duration
    average(:duration).to_i
  end

  def self.longest_duration
    maximum(:duration)
  end

  def self.shortest_duration
    minimum(:duration)
  end

  def self.most_popular_start_station
    station_id = joins(:start_station).group('trips.start_station_id', 'trips.id').order('COUNT(stations.name) DESC').first.start_station_id
    Station.find(station_id).name
  end

  def self.most_popular_end_station
    station_id = joins(:end_station).group('trips.end_station_id', 'trips.id').order('COUNT(stations.name) DESC').first.end_station_id
    Station.find(station_id).name
  end

  def self.most_ridden_bike
    group(:bike_id).count.max
  end

  def self.least_ridden_bike
    group(:bike_id).count.min
  end

  def self.most_popular_date
    group(:start_date).count.max
  end

  def self.least_popular_date
    group(:start_date).count.min
  end

  def self.subscription_type_counts
    group(:subscription_type).count
  end

  def self.subscription_type_percents
    type_counts = subscription_type_counts
    total = type_counts.values.sum
    type_counts.transform_values do |value|
      (value * 100.0 / total).round(2)
    end.sort
  end

  def self.subscription_type_breakdown
    type_percents = subscription_type_percents
    subscription_type_counts.values.sort.zip(type_percents)
  end

  def self.start_station_names
    joins(:start_station).pluck(:name).uniq.sort
  end

  def self.end_station_names
    joins(:end_station).pluck(:name).uniq.sort
  end

  def self.subscription_types
    pluck(:subscription_type).uniq
  end
end
