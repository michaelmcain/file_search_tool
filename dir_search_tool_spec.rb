require './file_search_tool.rb'

RSpec.describe FileSearchTool do

  describe 'Searches file for query matches' do
    let(:directory) { Dir.pwd }
    let(:file)      { File.new("#{Dir.pwd}/test_file.txt") }
    let(:query)     { 'test' }

    it 'parses file for lazy matches' do
      search = FileSearchTool.new(file: file, query: query)
      results = search.lazy_matcher
      expect(results).to include('3')
    end

    it 'parses file for strict matches' do
      search = FileSearchTool.new(file: file, query: query)
      results = search.strict_matcher
      expect(results).to include('2')
    end
  end
end
