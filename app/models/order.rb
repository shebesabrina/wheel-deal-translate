class Order < ApplicationRecord
  validates :status, presence: true
  
  belongs_to :user

  has_many :accessory_orders
  has_many :accessories, through: :accessory_orders

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total_price
    accessories.sum(:price)
  end

  def assign_accessories(contents)
    contents.each do |key, value|
      value.times do
        AccessoryOrder.create(order_id: id, accessory_id: key.to_i)
      end
    end
  end

  def accessory_quantity
    grouped_sub_total = Hash.new(0)
    accessory_id_quantity = accessories.group(:id).count
  end

  def sub_total
    grouped_sub_total = Hash.new(0)
    accessory_id_quantity = accessories.group(:id).count
    accessory_id_quantity = accessory_quantity
    accessory_id_quantity.each do |id, qty|
      accessory = Accessory.find(id)
      grouped_sub_total[accessory.title] = (qty * accessory.price)
    end
    return grouped_sub_total
  end

  def total_price
    accessories.sum(:price)
  end

end
