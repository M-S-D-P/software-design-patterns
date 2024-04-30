# Imagine you're building a file system application.
# You need to represent both individual files and directories (folders). Each directory can contain files and other directories,
# forming a tree-like structure. You want to perform operations such as printing the contents of directories and calculating the total size of a directory,
# regardless of whether it contains other directories or files.
# One might handle files and directories separately, resulting in a more procedural or non-uniform approach.


# Representing files
class File
  attr_reader :name, :size

  def initialize(name, size)
    @name = name
    @size = size
  end

  def print
    puts "#{name} (#{size} bytes)"
  end
end

# Representing directories
class Directory
  attr_reader :name, :contents

  def initialize(name)
    @name = name
    @contents = []
  end

  def add(file)
    @contents << file
  end

  def size
    @contents.sum(&:size)
  end

  def print
    puts "Directory: #{name}"
    @contents.each { |file| file.print }
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
