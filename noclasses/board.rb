class Board
  attr_accessor :board

  def initialize
    @board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
    @turn = 0
    @gameover = false
    @inputRow = ""
    @inputColumn = ""
    @playerTurn = "X"
    puts "New Game Started. X's turn. Select a row and column i.e. 1,2"
    self.display
    while @gameover == false
      self.win_condition
      self.tie_condition
      puts "Player #{@playerTurn}'s turn now."
      self.input
    end
  end

  def input
    @input = gets.chomp
    @inputRow = @input[0].to_i
    @inputColumn = @input[2].to_i
    if @playerTurn == "X"
      self.turn_x(@inputRow,@inputColumn)
    else 
      self.turn_o(@inputRow,@inputColumn)
    end
  end

  def tie_condition
    @boxes = @board.flatten(1)
    if @boxes.include?(" ") == false
      @gameover == true
      puts "Game tied."
      exit
    end
  end


  def display
    puts "-" * 7
    puts "|" + @board[0].join("|") + "|"
    puts "-" * 7
    puts "|" + @board[1].join("|") + "|"
    puts "-" * 7
    puts "|" + @board[2].join("|") + "|"
    puts "-" * 7
  end

  def turn_o(row, column)
    if @board[row][column] == " "
      @turn += 1
      puts "O placed on #{row},#{column} on turn #{@turn}"
      @board[row][column] = "O"
      self.display
      @playerTurn = "X"
    else
      puts "That spot was taken, try again"
    end
  end

  def turn_x(row, column)
    if @board[row][column] == " "
      @turn += 1
      puts "X placed on #{row},#{column} on turn #{@turn}"
      @board[row][column] = "X"
      self.display
      @playerTurn = "O"
    else
      puts "That spot was taken, try again"
    end
  end
  
  def win_condition
    for row in 0..2
      if (@board[row][0] == @board[row][1]) &&
         (@board[row][1] == @board[row][2]) &&
         (@board[row][0] != " ") &&
         (@board[row][1] != " ") &&
         (@board[row][2] != " ")
          if @board[row][1] == "X"
            puts "Player X wins"
          else puts "Player O wins"
          end
          @gameover = true
          exit
      end
    end
    for column in 0..2
      if (@board[0][column] == @board[1][column]) &&
         (@board[1][column] == @board[2][column]) &&
         (@board[0][column] != " ") &&
         (@board[1][column] != " ") &&
         (@board[2][column] != " ")
          if @board[1][column] == "X"
            puts "Player X wins"
          else puts "Player O wins"
          end
          @gameover = true
          exit
      end
    end

    #win conditions for diagonals
    if (@board[0][0] == @board[1][1]) &&
       (@board[1][1] == @board[2][2]) &&
       (@board[0][0] != " ") &&
       (@board[1][1] != " ") &&
       (@board[2][2] != " ")
        puts "Player #{@board[1][1]} wins"
        @gameover = true
        exit
    end
    if (@board[0][2] == @board[1][1]) &&
       (@board[1][1] == @board[2][0]) &&
       (@board[0][2] != " ") &&
       (@board[1][1] != " ") &&
       (@board[2][0] != " ")
         puts "Player #{@board[1][1]} wins"
         @gameover = true
         exit
    end
  end
end

new_game = Board.new