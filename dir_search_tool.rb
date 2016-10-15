class DirSearchTool

  attr_reader :files, :directory

  def initialize(directory)
    @directory = directory
    @files = nil
  end

  def prepare_files
    files = Dir.entries(@directory)
    files.shift(2)
    files.each {|f| f.prepend(directory + '/')}
    @files = files
  end

  def lazy_dir_matcher(query)
    results = []
    @files.each do |file|
      fst = FileSearchTool.new(file:file, query:query)
      results << fst.lazy_matcher
    end
    results
  end
end
