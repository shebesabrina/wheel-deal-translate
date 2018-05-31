class Accessory < ApplicationRecord
  validates :price, :title, :description, :thumbnail, presence: true
  belongs_to :user, optional: true
  enum role:[:active, :inactive]
end
