# Let us assume we have different shapes in the system
# Based on the shape_type, the below logic decides to create instances of different shape
# The real problem is

# if we were to create shapes directly in the client code, we would tightly couple the client code to the concrete shape classes.
# This means that if we wanted to add a new shape or modify an existing one, we would have to change the client code,
# which violates the Open/Closed Principle of SOLID design principles.

class Client
  def draw_shape(shape_type)
    if shape_type == "Circle"
      circle = Circle.new
      circle.draw
    elsif shape_type == "Square"
      square = Square.new
      square.draw
    end
  end
end