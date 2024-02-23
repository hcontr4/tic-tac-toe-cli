# board.rb

# Maintain piece locations/state of game
class Board

  attr_accessor :played_locations
  attr_reader :board

  def initialize
    @board = [
      [7, 8, 9],
      [4, 5, 6],
      [1, 2, 3]
    ]
    @played_locations = []
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

  def x_win?
    piece_win?('x')
  end

  def o_win?
    piece_win?('o')
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
  # Check if any 3 consecutive squares have a matching symbol
  def piece_win?(piece)
    h = check_horizontal?(piece)
    v = check_vertical?(piece)
    d = check_diagonal?(piece)
    c = check_counter?(piece)

    h || v || d || c
  end
  # Check all 3 rows for matching symbol
  def check_horizontal?(piece)
    @board.each { |row| return true if row.all? { |square| piece == square.to_s } }
    false
  end
  # Check all 3 columns for matching symbol
  def check_vertical?(piece)
    @board.transpose.each { |row| return true if row.all? { |square| piece == square.to_s } }
    false
  end
  # Check diagonal going top left to bottom right for matching symbol
  def check_diagonal?(piece)
    3.times { |i| return false unless piece == @board[i][i].to_s }
    true
  end
  # Check diagonal going bottom left to top right for matching symbol
  def check_counter?(piece)
    3.times { |i| return false unless piece == @board[i][(i - 2).abs].to_s }
    true
  end
end
