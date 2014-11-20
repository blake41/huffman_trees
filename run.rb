require './huffman.rb'
require './node.rb'
require './my_queue.rb'
require 'pry'
require 'pry-nav'

h = Huffman.new
h.run
code = h.encode
puts code
puts h.decode(code)
binding.pry
