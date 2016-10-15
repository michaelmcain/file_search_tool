require 'rspec'

class FileSearchTool

  attr_reader :file
  attr_accessor :query

  def initialize (args = {})
    @file = File.new(args[:file])
    @query = args[:query]
  end

  def lazy_matcher
    puts "Scanning document..."
    count = 0
    @file.each do |f|
      count += f.scan(query).count
    end
    results = "There are #{count} of complete or partial instances of #{query.upcase} in this file"
    @file.rewind
    results
  end

  def strict_matcher
    puts "Scanning document..."
    count = 0
    @file.each do |f|
      unless f.match(/\b#{@query}\b/).nil?
        count += f.match(/\b"?#{@query}"?\b/i).size
      end
    end
    results = "There are #{count} of strict instances of #{query.upcase} in this file"
    @file.rewind
    results
  end

end
