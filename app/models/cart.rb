class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    contents.values.sum
  end

  def add_cart(id)
    contents[id.to_s] = contents[id.to_s] + 1
  end

  def count_of(id)
    contents[id.to_s]
  end
end
