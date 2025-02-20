class Player
  attr_reader :name
  attr_accessor :inputRow, :inputColumn
  
  def initialize(name,mark)
    @name = name
    @mark = mark
    @inputRow
    @inputColumn
  end

  def mark
    @mark
  end

  def get_move
    puts "Where do you want to put your mark? Row,Column Format"
    input = gets.chomp
    @inputRow = input[0].to_i
    @inputColumn = input[2].to_i
  end

end