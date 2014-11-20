require './huffman.rb'
require './node.rb'
require './my_queue.rb'
require 'pry'
describe Huffman do

  it "should be able to encode a string and then decode it" do
    huffman = Huffman.new
    to_encode = "Iwantthismessagetogetencoded!"
    huffman.run(to_encode)
    code = huffman.encode
    expect(huffman.decode(code)).to eql(to_encode)
  end

  it "should compress the string" do
    huffman = Huffman.new
    to_encode = "Iwantthismessagetogetencoded!"
    uncompressed_bytes = to_encode.size
    huffman.run(to_encode)
    code = huffman.encode
    encoded_bits = code.scan(/\d{1,8}/)
    expect(encoded_bits.size).to be < uncompressed_bytes
  end

end