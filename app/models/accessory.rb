class Accessory < ApplicationRecord
  validates :price, :title, :description, :thumbnail, presence: true

  enum role:[:active, :inactive]
end
