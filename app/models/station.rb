class Station < ApplicationRecord
  validates_presence_of :name, :city, :dock_count, require: true

  has_many :trips

  # def started_at

  # end 
end