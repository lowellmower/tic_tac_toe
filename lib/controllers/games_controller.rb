require 'pry'
class GamesController

  attr_accessor :player_one, :player_two, :board, :view

  def initialize(args = {})
    args = defaults.merge(args)
    @view = args[:view]
    @board = args[:board]
    @player_one = args[:player_one]
    @player_two = args[:player_two]
  end

  def set_view
    view.clear
    view.welcome_message
    view.display(@board.to_s)
  end

  def play_game
    until board.winner?
      set_view
      get_move(player_one)
      validate_move(player_one)
      player_one.make_move(view.input, board)
      break if @board.winner?
      set_view
      # get_move(player_two)
      # validate_move(player_two)
      player_two.make_move(board)
      break if @board.winner?
    end
    set_view
    view.display "Winner is: #{board.winner}"
  end

  def validate_move(player)
    until player.valid_move?(view.input) && board.move_available?(view.input)
      set_view
      view.move_error
      get_move(player)
    end
  end

  def get_move(player)
    view.display "\n#{player.name.upcase}'s MOVE ('#{player.piece}')"
    view.enter_move
  end

  private

    def defaults
      {view: View.new, board: Board.new, player_one: Player.new, player_two: Computer.new}
    end

end