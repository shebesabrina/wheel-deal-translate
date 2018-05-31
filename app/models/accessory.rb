class Accessory < ApplicationRecord
  validates :price, :title, :description, presence: true
end
