# The SingletonFactory class ensures that only one instance of the factory is created throughout the application using the Singleton pattern.
# The create_product method of the factory is responsible for creating different types of products.
# The ProductA and ProductB classes are concrete products that the factory can create.
# The client code demonstrates how to use the singleton factory to create and operate on different products.

class SingletonFactory
  @@instance = nil

  def self.instance
    @@instance ||= new
  end

  private_class_method :new

  def create_product(type)
    case type
    when :product_a
      ProductA.new
    when :product_b
      ProductB.new
    else
      raise ArgumentError, "Unknown product type: #{type}"
    end
  end
end

class ProductA
  def operation
    puts "Product A operation"
  end
end

class ProductB
  def operation
    puts "Product B operation"
  end
end

# Client code
factory = SingletonFactory.instance
product_a = factory.create_product(:product_a)
product_a.operation

product_b = factory.create_product(:product_b)
product_b.operation




# Example#2

# In a large application,
# multiple modules or components might need to perform logging.
# Without a centralized logging system, each module might create its own logging mechanism,
# leading to redundancy and inconsistency. Additionally, creating multiple instances of logging systems
# can lead to resource wastage and difficulty in managing logs effectively.



class Logger
  def initialize
    # Initialization logic here
  end

  def log(message)
    # Logging logic here
    puts message
  end
end

class LoggerFactory
  @@instance = nil

  def self.instance
    @@instance ||= new
  end

  private_class_method :new

  def create_logger
    Logger.new
  end
end

# Client code
logger_factory = LoggerFactory.instance
logger = logger_factory.create_logger

logger.log("Error: Unable to connect to database")
logger.log("Warning: Disk space low")
