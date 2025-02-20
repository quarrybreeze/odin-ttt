require_relative "board"
require_relative "player"

class Game
  
  def initialize
    @board = Board.new
    @players = [
      Player.new("Player 1", "X"),
      Player.new("Player 2", "O")
    ]
    @current_player = @players.first
    @gameover = false
    self.play
  end

  def switch_turns
    if @current_player == @players.first
      @current_player = @players.last
    else 
      @current_player = @players.first
    end
  end

  def play
    gameover = false

    while gameover == false
      @board.display
      @board.winner?
      puts "Now it is #{@current_player.name}'s turn"
      @current_player.get_move
      if @board.valid_move?(@current_player.inputRow,@current_player.inputColumn) == true 
        @board.place_mark(@current_player.inputRow,@current_player.inputColumn,@current_player.mark)
        self.switch_turns
      end
      # gameover = true
      # puts "Game over!"
    end
  end

end