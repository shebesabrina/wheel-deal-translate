class Accessory < ApplicationRecord
  validates :price, :title, :description, :thumbnail, presence: true
end
