class Trip < ApplicationRecord
  validates :duration,
            :start_date,
            :start_station,
            :end_date,
            :end_station,
            :bike_id,
            :subscription_type, presence: true

  belongs_to :start_station, class_name: "Station", foreign_key: "start_station"
  belongs_to :end_station, class_name: "Station", foreign_key: "end_station"
end
