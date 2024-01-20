class Product
  attr_accessor :name, :price, :size, :color
end

class ProductBuilder
  attr_reader :product

  def initialize
    @product = Product.new
  end

  def set_name(name)
    @product.name = name
    self
  end

  def set_price(price)
    @product.price = price
    self
  end

  def set_size(size)
    @product.size = size
    self
  end

  def set_color(color)
    @product.color = color
    self
  end
end

product = ProductBuilder.new
  .set_name("Example Product")
  .set_price(19.99)
  .set_size("Medium")
  .set_color("Blue")
  .product

puts "Product Details:"
puts "Name: #{product.name}"
puts "Price: #{product.price}"
puts "Size: #{product.size}"
puts "Color: #{product.color}"
