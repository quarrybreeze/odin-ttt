class Board

  def initialize
    @grid = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
  end

  def display
    puts "-" * 7
    @grid.each do |row|
      puts "|" + row.join("|") + "|"
      puts "-" * 7
    end
  end

  def place_mark(row,col,mark)
    row = row.to_i
    col = col.to_i
    if valid_move?(row,col)
      @grid[row][col] = mark
    end
  end

  def valid_move?(row,col)
    row = row.to_i
    col = col.to_i
    empty = " "
    if (@grid[row][col] != empty) ||
       (row.between?(0,2) == false) ||
       (col.between?(0,2) == false)
      puts "Move invalid, try again"
      return false
    else 
      return true
    end
  end

  def winner?
    check_rows
    check_columns
    check_diagonals
    full?
  end

  private

  def check_rows
    @grid.each do |row|
      if three_in_a_row?(row)
        announce_winner(row[0])
      end
    end
  end
  
  def check_columns
    (0..2).each do |col|
      column = [@grid[0][col], @grid[1][col], @grid[2][col]]
      if three_in_a_row?(column)
        announce_winner(column[0])
      end
    end
  end

  def check_diagonals
    diagonals = [
      [@grid[0][0], @grid[1][1], @grid[2][2]],
      [@grid[0][2], @grid[1][1], @grid[2][0]]
    ]
    
    diagonals.each do |diag|
      announce_winner(diag[0]) if three_in_a_row?(diag)
    end
  end
  
  def three_in_a_row?(line)
    line.uniq.length == 1 && line.first != " "
  end
  
  def announce_winner(mark)
    puts "Player #{mark} wins"
    @gameover = true
    exit
  end

  def full?
    flat_grid = @grid.flatten(1)
    if flat_grid.include?(" ") == false
      @gameover = true
      puts "Game tied"
      exit
    end
  end
end
