# Component interface
class FileSystemComponent
  def size
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def print
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Leaf class representing a file
class File < FileSystemComponent
  attr_reader :name, :size

  def initialize(name, size)
    @name = name
    @size = size
  end

  def print
    puts "#{name} (#{size} bytes)"
  end
end

# Composite class representing a directory
class Directory < FileSystemComponent
  attr_reader :name

  def initialize(name)
    @name = name
    @contents = []
  end

  def add(component)
    @contents << component
  end

  def remove(component)
    @contents.delete(component)
  end

  def size
    @contents.sum(&:size)
  end

  def print
    puts "Directory: #{name}"
    @contents.each(&:print)
  end
end


# Creating files
file1 = File.new("file1.txt", 100)
file2 = File.new("file2.txt", 200)
file3 = File.new("file3.txt", 300)

# Creating directories
dir1 = Directory.new("Documents")
dir2 = Directory.new("Pictures")

# Adding files to directories
dir1.add(file1)
dir1.add(file2)
dir2.add(file3)

# Creating a nested directory
nested_dir = Directory.new("Downloads")
nested_dir.add(dir1)
nested_dir.add(dir2)

# Printing contents and calculating total size
nested_dir.print
puts "Total size: #{nested_dir.size} bytes"
