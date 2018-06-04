class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_item_cart(id)
    if @contents[id.to_s].nil?
      @contents[id.to_s] = 1
    else
    @contents[id.to_s] += 1
    end
  end

  def reduce_item_cart(id)
    @contents[id.to_s] -= 1
  end

  def count_of(id)
    @contents[id.to_s]
  end

  def subtotal(id)
    @contents[id.to_s] * total_count
  end

  def total_accessory_value
    values = []
    @contents.each do |key, value|
      values << Accessory.find(key).price * value
    end
    values.sum
  end

  def delete_accessory(id)
    @contents.delete(id)
  end
end
