class DirSearchTool

  attr_reader :files, :directory

  def initialize(directory)
    @directory = directory
    @files = nil
  end

  def prepare_files
    puts 'Preparing files to be searched...'
    files = Dir.entries(@directory)
    files.shift(2)
    files.each {|f| f.prepend(directory + '/')}
    @files = files
  end

  def lazy_dir_matcher(query)
    puts 'Searching directory for matches'
    results = []
    @files.each do |file|
      fst = FileSearchTool.new(file:file, query:query)
      results << fst.lazy_matcher
    end
    results
  end

  def strict_dir_matcher(query)
    puts 'Searching directory for matches'
    results = []
    @files.each do |file|
      fst = FileSearchTool.new(file:file, query:query)
      results << fst.strict_matcher
    end
    results
  end
end
