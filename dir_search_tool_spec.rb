require './dir_search_tool.rb'
require './file_search_tool.rb'

RSpec.describe DirSearchTool do

  describe 'Parses a directory and invokes FileSearchTool' do
    let(:directory) { "#{Dir.pwd}/test_dir" }
    let(:search)    { DirSearchTool.new(directory) }
    let(:file)      { File.new("#{Dir.pwd}/test_dir/test_file.txt") }
    let(:query)     { 'test' }

    it 'creates an array of files to parse' do
      array = search.prepare_files
      expect(array.size).to eq(3)
    end

    it 'invokes a lazy search FileSearchTool' do
      search.prepare_files
      result = search.lazy_dir_matcher('test')
      expect(result).to match(/of complete or partial instances/)

    end
  end
end
