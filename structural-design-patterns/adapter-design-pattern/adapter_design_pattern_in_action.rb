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

# Adapter class to make LegacyPrinter compatible with ModernPrinter interface
class PrinterAdapter
  def initialize(legacy_printer)
    @legacy_printer = legacy_printer
  end

  def print
    @legacy_printer.print_message
  end
end

# Client code expecting ModernPrinter interface
def client_code(printer)
  printer.print
end

# Using ModernPrinter directly
modern_printer = ModernPrinter.new("Hello from the modern printer!")
client_code(modern_printer) # Output: Modern Printer: Hello from the modern printer!

# Using LegacyPrinter with Adapter
legacy_printer = LegacyPrinter.new("Hello from the legacy printer!")
adapter = PrinterAdapter.new(legacy_printer)
client_code(adapter) # Output: Legacy Printer: Hello from the legacy printer!
