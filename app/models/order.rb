class Order < ApplicationRecord
  validates :status, presence: true

  belongs_to :user

  has_many :accessory_orders
  has_many :accessories, through: :accessory_orders

  enum status: [:ordered, :paid, :cancelled, :completed]

  scope :status, -> (status) { where status: status }

  def total_price
    accessories.sum(:price)
  end

  def self.by_status
    group(:status).count
  end
  # 
  # def self.orders_paid
  #   where(status: "paid")
  # end
  #
  # def self.orders_cancelled
  #   where(status: "cancelled")
  # end
  #
  # def self.orders_completed
  #   where(status: "completed")
  # end
  #
  # def self.orders_ordered
  #   where(status: "ordered")
  # end

end
