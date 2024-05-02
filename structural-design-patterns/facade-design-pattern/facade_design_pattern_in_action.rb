# Subsystem classes
class CPU
  def execute
    puts "Executing CPU instructions"
  end
end

class Memory
  def load
    puts "Loading data into memory"
  end
end

class HardDrive
  def read
    puts "Reading data from the hard drive"
  end
end

# Facade class
class ComputerFacade
  def initialize
    @cpu = CPU.new
    @memory = Memory.new
    @hard_drive = HardDrive.new
  end

  def start
    @cpu.execute
    @memory.load
    @hard_drive.read
    puts "Computer started successfully"
  end
end

# Client code
facade = ComputerFacade.new
facade.start
