# board.rb

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
end