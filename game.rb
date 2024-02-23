# game.rb

require_relative 'board'

class Game
  def initialize
    @board = Board.new
    @x_turn = true
    @played_locations = []
    @winner = nil
  end

  def play_game
    loop do 
      do_board
      do_move
    end
  end

  def do_board
    puts
    @board.print_board
    puts
  end

  def do_move
    print 'Move?'
    move = gets.chomp.to_i
  end
end