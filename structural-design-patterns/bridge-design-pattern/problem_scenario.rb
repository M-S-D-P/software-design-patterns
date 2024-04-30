# Without Bridge Pattern
# Suppose you have a drawing application where you need to draw shapes with different colors.
# Without the Bridge pattern, you might create separate subclasses for each combination of shape and color (e.g., RedCircle, BlueSquare, etc.).
# However, this approach quickly becomes unwieldy as the number of shapes and colors grows, leading to a combinatorial explosion of classes.
class Shape
  def draw
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Circle < Shape
  def draw(color)
    "Drawing a Circle with #{color} color"
  end
end

class Square < Shape
  def draw(color)
    "Drawing a Square with #{color} color"
  end
end

# Usage
red_circle = Circle.new
puts red_circle.draw('Red') # Output: "Drawing a Circle with Red color"

blue_square = Square.new
puts blue_square.draw('Blue') # Output: "Drawing a Square with Blue color"
