# Prototype class representing a car
class Car
  attr_accessor :make, :model, :year, :color

  def initialize(make, model, year, color)
    @make = make
    @model = model
    @year = year
    @color = color
  end

  def clone
    self.dup
  end

  def to_s
    "#{@year} #{@make} #{@model}, #{@color}"
  end
end

# Client code
prototype_car = Car.new("Toyota", "Corolla", 2022, "Black")
puts "Prototype Car: #{prototype_car}"

# Cloning prototype to create new cars
car1 = prototype_car.clone
car1.color = "Red"
puts "Car 1: #{car1}"

car2 = prototype_car.clone
car2.year = 2023
puts "Car 2: #{car2}"
