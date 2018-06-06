class Order < ApplicationRecord
  validates :status, presence: true
  
  belongs_to :user

  has_many :accessory_orders
  has_many :accessories, through: :accessory_orders

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    accessories.sum(:price)
  end

  def self.by_status
    Order.group(:status).count
  end

  def self.orders_paid
    Order.where(status: "paid")
  end

  def self.orders_cancelled
    Order.where(status: "cancelled")
  end

  def self.orders_completed
    Order.where(status: "completed")
  end

  def self.orders_ordered
    Order.where(status: "ordered")
  end

end
