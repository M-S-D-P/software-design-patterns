# Let's consider a scenario where we need to build a house.
# A house can have various attributes such as the number of bedrooms, bathrooms, floors, whether it has a garage or not, etc.
# Using the Builder pattern, we can create different types of houses with different configurations while keeping the construction process consistent.

# Product class representing a house
class House
  attr_access :bathrooms, :bedrooms, :garage, :floors

  def initialize
    @bathrooms = 0
    @bedrooms = 0
    @floors = 1
    @garage = false
  end

  def to_s
    "House with #{@bedrooms} bedrooms, #{@bathrooms} bathrooms, #{@floors} floors, #{garage ? 'with' : 'without'} garage"
  end
end

# Builder interface defining steps to build a house
class HouseBuilder
  def add_bedrooms(num); end
  def add_bathrooms(num); end
  def floors; end
  def garage; end
end

# Builder factory - Builder implements Builder Interface to construct a house
class HouseBuilderFactory < HouseBuilder
  def initialize
    @house = House.new
  end

  def add_bedrooms(num)
    @house.bedrooms = num
  end

  def add_bathrooms(num)
    @house.bathrooms = num
  end

  def add_floors(num)
    @house.floors = num
  end

  def add_garage
    @house.garage = true
  end

  def get_house
    @house
  end
end


# HouseDirector who have controls to build the house
class HouseDirector
  def initialize(builder)
    @builder = builder
  end

  def construct_house
    @builder.add_bedrooms(3)
    @builder.add_bathrooms(3)
    @builder.add_floors(2)
    @builder.add_garage
    @builder.get_house
  end
end


builder = HouseBuilderFactory.new
director = HouseDirector(builder)
director.construct_house
house = builder.get_house
puts house