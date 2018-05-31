class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_cart(id)
    if @contents[id]
      @contents[id] += 1
    else
    @contents[id] = 1
    end
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
    @contents.delete(id.to_s)
  end
end
