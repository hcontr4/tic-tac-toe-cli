# board.rb

# Maintain state of the game
class Board
  def initialize
    @board = [
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3]
    ]
  end
      
  def print_board
    3.times do |row|
      puts '|---|---|---|'
      puts "| #{@board[row][0]} | #{@board[row][1]} | #{@board[row][2]} |"
    end
      puts '|---|---|---|'
  end

  def add_x(location)
    add_piece(location, 'x')
  end

  def add_o(location)
    add_piece(location, 'o')
  end

  def add_piece(location, piece)
    case location
    when 7..9
      @board[0][location - 7] = piece
    when 4..6
      @board[1][location - 4] = piece
    when 1..3
      @board[2][location - 1] = piece
    end
  end
end