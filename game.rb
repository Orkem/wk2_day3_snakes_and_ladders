require_relative("./board.rb")
require_relative("./player.rb")




# while !player.have_won?(board) || player.position_on_board > 9 
#   play = gets.chomp
#   if play == "q" || play == "quit"
#     break
#   end
#   if play == "roll"
#     player.move(board.die.roll)
#     player.board_state(board)
#   end
# end
class Game
  attr_reader :player, :board_obj
  def initialize()
    print "Enter player 1's name"
    # player = Player.new(gets.chomp)
    @player = Player.new('atttt')
    @board_obj = Board.new()
  end

  def snake_or_ladder()
    for snake in @board_obj.snakes
      if (@player.position_on_board == snake.head_pos)
        @player.position_on_board = snake.tail_pos
      end
    end

    for ladder in @board_obj.ladders
      if (@player.position_on_board == ladder.bottom_pos)
        @player.position_on_board = ladder.top_pos
      end
    end
  end

  def have_won?()
    return true if @player.position_on_board == @board_obj.squares[-1]
  end
end