class MyQueue

  attr_reader :data

  def initialize(data)
    @data = data
    sort!
  end

  def next
    data.shift
  end

  def remaining
    sum = 0
    letters = ""
    data.each do |pair| 
      sum += pair[1]
      letters += pair[0]
    end
    [letters, sum]
  end

  def empty?
    remaining == ["", 0]
  end

  def last?
    remaining.first.size == 1
  end

private
  def sort!
    @data = data.sort_by do |letter, freq|
      freq
    end.reverse
  end

end