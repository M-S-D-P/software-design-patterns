# With Bridge Pattern

class Shape
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def draw
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Circle < Shape
  def draw
    "Drawing a Circle with #{color} color"
  end
end

class Square < Shape
  def draw
    "Drawing a Square with #{color} color"
  end
end

class Color
  def fill_color
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class RedColor < Color
  def fill_color
    'Red'
  end
end

class BlueColor < Color
  def fill_color
    'Blue'
  end
end

# Usage
red_circle = Circle.new(RedColor.new)
puts red_circle.draw # Output: "Drawing a Circle with Red color"

blue_square = Square.new(BlueColor.new)
puts blue_square.draw # Output: "Drawing a Square with Blue color"
