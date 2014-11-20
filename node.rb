class Node

  attr_accessor :left, :right, :chars, :freq

  def initialize(data = [])
    begin
      @chars = data[0]
      @freq = data[1]
    rescue => e
      binding.pry
    end
  end

  def children?
    if left || right
      return true
    else
      return false
    end
  end

end