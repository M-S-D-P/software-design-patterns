
# By using the Factory pattern,
# we can decouple the client code from the concrete shape classes.
# The client code only interacts with the ShapeFactory interface, which abstracts the creation of shapes.
# This allows us to add new shapes or modify existing ones without changing the client code.

class Shape
  def draw
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Circle < Shape
  def draw
    puts "Inside Circle: draw method"
  end
end

class Square < Shape
  def draw
    puts "Inside Square: draw method"
  end
end
# -----------------------------------------------------------------------------------------
class ShapeFactory
  def get_shape(shape_type)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteShapeFactory < ShapeFactory
  def get_shape(shape_type)
    if shape_type == "Circle"
      return Circle.new
    elsif shape_type == "Square"
      return Square.new
    else
      puts "Shape #{shape_type} not found"
    end
    return nil
  end
end
# -----------------------------------------------------------------------------------------
# Client Code
class Client
  def draw_shape(factory, shape_type)
    shape = factory.get_shape(shape_type)
    shape.draw if shape
  end
end

# Usage
factory = ConcreteShapeFactory.new
client = Client.new

client.draw_shape(factory, "Circle")  # Output: Inside Circle: draw method
client.draw_shape(factory, "Square")  # Output: Inside Square: draw method
client.draw_shape(factory, "Rectangle") # Output: Shape Rectangle not found

# In this example:

# The ConcreteShapeFactory is responsible for creating instances of Circle and Square based on the input provided to the get_shape method.
# The client code only interacts with the ShapeFactory interface, and it doesn't need to know the specific type of shape it's dealing with.
# This decoupling allows us to easily add new shapes or modify existing ones by simply extending the Shape class and updating the ConcreteShapeFactory class, without changing the Client class or any other client code.