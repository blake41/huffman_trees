class Huffman
  attr_reader :queue, :data, :freq

  def tree
    @root
  end
  
  def run(string)
    take_input(string)
    find_frequencies
    build_tree
  end

  def encode
    data.split("").collect do |letter|
      encode_letter(letter)
    end.join("")
  end

  def decode(data)
    decoded = ""
    the_code = data.split("").collect{|number| number.to_i}
    current = @root
    the_code.each do |bit|
      if bit == 0
        decoded += current.left.chars
        current = @root
      else bit == 1
        if current.chars.size == 2
          decoded += current.right.chars
          current = @root
        else
          current = current.right
        end
      end
    end
    decoded
  end

private
  def build_tree
    @root = Node.new(queue.remaining)
    current = @root
    until queue.empty?
      current.left=(Node.new(queue.next))
      if queue.last?
        current.right=(Node.new(queue.next))
      else
        current.right=(Node.new(queue.remaining))
      end
      current = current.right
    end
  end

  def take_input(string = "")
    if string.empty?
      @data = ARGV.join("")
    else
      @data = string
    end
  end

  def find_frequencies
    @freq = Hash.new(0)
    data.each_char do |letter|
      @freq[letter] += 1
    end
    @queue = MyQueue.new(freq)
  end

  def encode_letter(letter)
    path = []
    current = @root
    until stop_condition(current, letter)
      if current.left.chars == letter
        path << 0
        current = current.left
      else
        path << 1
        current = current.right
      end
    end
    path
  end

  def stop_condition(node, letter)
    return true if node.nil?
    node.chars == letter
  end

end