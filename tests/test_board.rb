
require 'minitest/autorun'
require './board'

class TestBoard < Minitest::Test

  def test_add_x
    board = Board.new

    board.add_x(5)

    after_add = [
      [7, 8, 9],
      [4, 'x', 6],
      [1, 2, 3]
    ]

    assert_equal after_add, board.board, "Add x method failed"
  end

  def test_add_y
    board = Board.new

    board.add_o(8)

    after_add = [
      [7, 'o', 9],
      [4, 5, 6],
      [1, 2, 3]
    ]

    assert_equal after_add, board.board, "Add y method failed"
  end

  def test_horizontal
    board = Board.new

    board.add_x(1)
    board.add_x(2)
    board.add_x(3)
    
    assert_equal true, board.check_horizontal?('x'), "Horizontal check failed"
  end

  def test_vertical
    board = Board.new

    board.add_x(1)
    board.add_x(4)
    board.add_x(7)
    
    assert_equal true, board.check_vertical?('x'), "Vertical check failed"
  end

  def test_diagonal
    board = Board.new

    board.add_x(7)
    board.add_x(5)
    board.add_x(3)
    
    assert_equal true, board.check_diagonal?('x'), "Diagonal check failed"
  end

  def test_counter
    board = Board.new

    board.add_x(1)
    board.add_x(5)
    board.add_x(9)
    
    assert_equal true, board.check_counter?('x'), "Counter-Diagonal check failed"
  end
end