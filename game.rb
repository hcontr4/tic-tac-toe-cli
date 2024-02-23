# game.rb

require_relative 'board'

# Maintains turns 
class Game
  def initialize
    @board = Board.new
    @x_turn = true
    @winner = nil
  end

  def play_game
    loop do
      do_board
      do_move

      break if game_over?
    end
    puts "\n#{@winner} wins!" if @winner == 'x' || @winner == 'o'
    puts "\n Game is a tie!" if @winner == 't'
    sleep(1)
    do_board
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

      puts "\nINVALID MOVE\n\n"
    end
  
    @x_turn ? @board.add_x(move) : @board.add_o(move)
    @board.played_locations.append(move)
  end

  def valid_move?(move)
    move.between?(1, 9) && !@board.played_locations.include?(move) ? true : false
  end

  def game_over?
    if @board.x_win?
      @winner = 'x'
      true
    elsif @board.o_win?
      @winner = 'o'
      true
    elsif @board.played_locations.length == 9
      @winner = 't'
      true
    else
      @x_turn = !@x_turn
      false
    end
  end
end
