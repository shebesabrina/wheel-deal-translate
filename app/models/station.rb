class Station < ApplicationRecord
  validates_presence_of :name, :city, :dock_count, require: true

  has_many :trip_stations
  has_many :trips, through: :trip_stations

  # def started_at

  # end 
end