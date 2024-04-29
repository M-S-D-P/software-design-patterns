# Let's say we have a client code that expects the ModernPrinter interface, but we only have access to the LegacyPrinter. Without the Adapter pattern, we would need to modify the client code to work with the LegacyPrinter, which could be undesirable if the client code is widespread or if modifying it is not feasible.


# LegacyPrinter class with incompatible interface
class LegacyPrinter
  def initialize(message)
    @message = message
  end

  def print_message
    puts "Legacy Printer: #{@message}"
  end
end

# ModernPrinter class with the desired interface
class ModernPrinter
  def initialize(text)
    @text = text
  end

  def print
    puts "Modern Printer: #{@text}"
  end
end



# Client code expecting ModernPrinter interface
def client_code(printer)
  printer.print
end

# Using ModernPrinter directly
modern_printer = ModernPrinter.new("Hello, world!")
client_code(modern_printer) # Output: Modern Printer: Hello, world!

# Using LegacyPrinter directly (without adapter)
legacy_printer = LegacyPrinter.new("Hello, world!")
client_code(legacy_printer) # Error: undefined method `print' for #<LegacyPrinter:0x00007f863405e8c0>
