require 'rspec'

class FileSearchTool

  attr_reader :file
  attr_accessor :query

  def initialize (file, query)
    @file = File.new(file)
    @query = query
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

RSpec.describe FileSearchTool do

  describe 'Searches file for query matches' do

    let(:file) 		{File.new("#{Dir.pwd}/test_file.txt")}
    let(:query) 	{'test'}

    it 'parses file for lazy matches' do
      search = FileSearchTool.new(file, query)
      results = search.lazy_matcher
      expect(results).to include('3')
    end

    it 'parses file for strict matches' do
      search = FileSearchTool.new(file, query)
      results = search.strict_matcher
      expect(results).to include('2')
    end

  end

end
