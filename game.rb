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

      @x_turn = !@x_turn
    end
  end

  private
  
  def do_board
    puts
    @board.print_board
    puts
  end

  def do_move
    move = 0
    loop do
      print 'Move for '
      print @x_turn ? 'x: ' : 'o: '
      move = gets.chomp.to_i

      break if valid_move?(move)

      puts "\nINVALID MOVE!\n\n"
    end

    @x_turn ? @board.add_x(move) : @board.add_o(move)
    @played_locations.append(move)
  end

  def valid_move?(move)
    move.between?(1, 9) && !@played_locations.include?(move) ? true : false
  end
end