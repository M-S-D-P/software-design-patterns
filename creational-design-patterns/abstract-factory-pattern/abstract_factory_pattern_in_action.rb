# Abstract Factory
class GUIFactory
  def create_button
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_text_field
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_menu
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Factory 1: Dark Theme
class DarkThemeFactory < GUIFactory
  def create_button
    DarkButton.new
  end

  def create_text_field
    DarkTextField.new
  end

  def create_menu
    DarkMenu.new
  end
end

# Concrete Factory 2: Light Theme
class LightThemeFactory < GUIFactory
  def create_button
    LightButton.new
  end

  def create_text_field
    LightTextField.new
  end

  def create_menu
    LightMenu.new
  end
end

# Abstract Product: Button
class Button
  def click
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Product 1: Dark Button
class DarkButton < Button
  def click
    puts "Dark button clicked"
  end
end

# Concrete Product 2: Light Button
class LightButton < Button
  def click
    puts "Light button clicked"
  end
end

# Abstract Product: Text Field
class TextField
  def type(text)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Product 1: Dark Text Field
class DarkTextField < TextField
  def type(text)
    puts "Dark text field typed: #{text}"
  end
end

# Concrete Product 2: Light Text Field
class LightTextField < TextField
  def type(text)
    puts "Light text field typed: #{text}"
  end
end

# Abstract Product: Menu
class Menu
  def select_option(option)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Product 1: Dark Menu
class DarkMenu < Menu
  def select_option(option)
    puts "Dark menu option selected: #{option}"
  end
end

# Concrete Product 2: Light Menu
class LightMenu < Menu
  def select_option(option)
    puts "Light menu option selected: #{option}"
  end
end

# Client Code
def create_gui(factory)
  button = factory.create_button
  text_field = factory.create_text_field
  menu = factory.create_menu

  button.click
  text_field.type("Hello, world!")
  menu.select_option("Settings")
end

# Using Dark Theme
dark_factory = DarkThemeFactory.new
create_gui(dark_factory)

# Using Light Theme
light_factory = LightThemeFactory.new
create_gui(light_factory)
