class Accessory < ApplicationRecord
  before_create :set_default_image

  validates :description, presence: true
  validates_uniqueness_of :title
  validates_numericality_of :price, :on => :create

  belongs_to :user, optional: true
  has_many :accessory_orders
  has_many :orders, through: :accessory_orders

  enum role:[:active, :inactive]

  def set_default_image
    self.thumbnail = 'bike_horse.jpg' if thumbnail.empty?
  end

  def check_role(role)
  end
end
