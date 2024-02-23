# driver.rb

require_relative 'game'

puts "\nTIC-TAC-TOE\n\n"

loop do
  print "Enter 's' to start a game or 'q' to exit: "
  user_input = gets.chomp.downcase

  case user_input
  when 's'
    game = Game.new
    game.play_game
  when 'q'
    puts "Exiting the game. Goodbye!"
    break
  else
    puts "Invalid input. Please enter 's' to start the game or 'q' to exit."
  end
end
