class FileAdapter
  def initialize(file)
    @file = file
  end

  def read_content
    "Any class writen in ruby format in ##{@file}"
  end

  def write_to_ruby_file(output_file)
    File.open(output_file, 'w') { |f| f.write("puts '#{read_content}'") }
    puts "Content written to Ruby file: #{output_file}"
  end
end

class Client
  def initialize(file_adapter)
    @file_adapter = file_adapter
  end

  def process_file_and_write_to_ruby(output_file)
    content = @file_adapter.read_content
    @file_adapter.write_to_ruby_file(output_file)
  end
end

file_adapter = FileAdapter.new("text_format_file.txt")
client = Client.new(file_adapter)
output_file = "ruby_format_file.rb"
client.process_file_and_write_to_ruby(output_file)
