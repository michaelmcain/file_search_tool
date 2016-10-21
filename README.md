# File Search Tool
### The File Search Tool (FST) is a tool to scan a document or a directory looking for lazy or strict matches of a given word.
***

### Usage

#### _To search a file:_

Instaniate the FST with the file (from PWD) and the string you'd like to search for:
`search = FileSearchTool.new('./test_file.txt', 'query')`

**For 'lazy' matches**, use `lazy_matcher`, which will return a count of partial or complete matches

**For strict matches**, use `strict_matcher`, which will return a count of only strict query matches

***

#### _To search a directory:_

Instaniate the FST with the directory you would like to search in:
`dir = DirSearchTool.new('directory')`

**For 'lazy' matches**, use `dir_lazy_matcher('query')`, which will return lazy search results for each file in the directory.

**For strict matches**, use `dir_strict_matcher('query')`, which will return strict search results for each file in the directory.

_create by Michael Cain, 9-25-2016_
_updated by Michael Cain, 10-15-2016_
