# Flyweight factory
class CharacterFactory
  def initialize
    @characters = {}
  end

  def get_character(char)
    @characters[char] ||= Character.new(char)
  end

  def character_count
    @characters.size
  end
end

# Flyweight class
class Character
  attr_reader :char, :color

  def initialize(char)
    @char = char
    @font = 'Arial' # Intrinsic state
    @size = 12 # Intrinsic state
    # Other intrinsic state properties can be added here
  end

  def render(x, y, color)
    @color = color # Extrinsic state
    puts "Rendering #{@char} at (#{x}, #{y}) with font #{@font}, size #{@size}, and color #{@color}"
    # Rendering logic using intrinsic and extrinsic state
  end
end

# Client code
factory = CharacterFactory.new

characters_to_render = [
  { char: 'A', color: 'red' },
  { char: 'B', color: 'blue' },
  { char: 'C', color: 'green' },
  { char: 'A', color: 'yellow' },
  { char: 'B', color: 'purple' },
  { char: 'D', color: 'orange' }
]

characters_to_render.each_with_index do |char_info, index|
  character = factory.get_character(char_info[:char])
  character.render(index * 10, index * 20, char_info[:color])
end

puts "Total number of unique characters rendered: #{factory.character_count}"


# CharacterFactory acts as a factory for creating and managing Character objects. It ensures that each unique character is created only once and shared among multiple clients.
# Character represents the flyweight object with intrinsic state (e.g., character itself, font, size). The intrinsic state is shared among multiple Character instances.
# In the client code, we obtain Character objects from the factory and render them at different positions. Since the intrinsic state is shared, memory usage is minimized.
# By using the Flyweight pattern, you can optimize memory usage and improve performance, especially in scenarios where you need to manage a large number of similar objects with shared state.