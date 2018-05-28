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
end
