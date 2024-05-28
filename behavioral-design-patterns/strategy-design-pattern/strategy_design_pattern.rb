# The strategy interface declares a method that all concrete strategies must implement.
module Strategy
  def execute(a, b)
    raise NotImplementedError, 'Strategies must implement the execute method'
  end
end

# Concrete strategies implement the strategy interface with specific algorithms.

class AddStrategy
  include Strategy

  def execute(a, b)
      a + b
  end
end

class SubtractStrategy
  include Strategy

  def execute(a, b)
      a - b
  end
end

class MultiplyStrategy
  include Strategy

  def execute(a, b)
      a * b
  end
end

# The context maintains a reference to a strategy object and allows clients to set or change the strategy.

class Context
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def execute_strategy(a, b)
    @strategy.execute(a, b)
  end
end


# Putting It All Together

# Create strategies
add_strategy = AddStrategy.new
subtract_strategy = SubtractStrategy.new
multiply_strategy = MultiplyStrategy.new

# Create context with initial strategy
context = Context.new(add_strategy)
puts "Add Strategy: #{context.execute_strategy(5, 3)}" # Output: 8

# Change strategy to Subtract
context.strategy = subtract_strategy
puts "Subtract Strategy: #{context.execute_strategy(5, 3)}" # Output: 2

# Change strategy to Multiply
context.strategy = multiply_strategy
puts "Multiply Strategy: #{context.execute_strategy(5, 3)}" # Output: 15

