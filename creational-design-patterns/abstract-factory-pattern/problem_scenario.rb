# Problem Scenario:
# You're developing a GUI application that allows users to customize the theme (like "Dark Theme" or "Light Theme").
# The application includes various GUI components such as buttons, text fields, and menus.
# However, you've noticed that whenever you add a new theme, you end up cluttering your code with conditional statements to select the appropriate components based on the theme.
# This approach violates the Open/Closed Principle of SOLID design because every time you add a new theme, you need to modify existing code.

class GUIApplication
  def initialize(theme)
    @theme = theme
  end

  def create_button
    if @theme == "dark"
      DarkButton.new
    elsif @theme == "light"
      LightButton.new
    else
      raise ArgumentError, "Unknown theme: #{@theme}"
    end
  end

  # Similar methods for creating text fields, menus, etc.
end

class DarkButton
  def click
    puts "Dark button clicked"
  end
end

class LightButton
  def click
    puts "Light button clicked"
  end
end

# Client Code
app = GUIApplication.new("dark")
button = app.create_button
button.click
