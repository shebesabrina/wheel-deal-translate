class Accessory < ApplicationRecord
  validates :title,
            :description,
            :thumbnail,
            :price, presence: true
end
