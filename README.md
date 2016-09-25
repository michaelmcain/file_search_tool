# File Search Tool
### The File Search Tool (FST) is a tool to scan a document looking for lazy or strict matches of a given word.
***

###Usage

Instaniate the FST with the file (from PWD) and the string you'd like to search for:
`search = FileSearchTool.new('./test_file.txt', 'query')`

**For 'lazy' matches**, use `lazy_matcher`, which will return a count of partial or complete matches

**For strict matches**, use `strict_matcher`, which will return a count of only strict query matches

_create by Michael Cain, 9-25-2016_