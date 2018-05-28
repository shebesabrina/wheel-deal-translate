class TripStation < ApplicationRecord
  belongs_to :trip
  belongs_to :station
end