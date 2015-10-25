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
    view.welcome
    view.display(@board.to_s)
  end

  def play_game
    set_view
    until board.winner?
      set_view
      current_move = @view.enter_move
      @player_one.make_move(current_move, @board)
      break if @board.winner?
      set_view
      current_move = @view.enter_move
      @player_two.make_move(current_move, @board)
      break if @board.winner?
    end
    view.display "Winner is: #{board.winner}"
  end


  # def run
  #   game_init
  #   until win
  #     get_home_view
  #     player_one.get_move(tic_tac_toe)
  #     break if win
  #     get_home_view
  #     player_two.get_move(tic_tac_toe)
  #     get_home_view
  #     break if win
  #   end
  #   view.display "Result : #{tic_tac_toe.winner} "
  # end

  private

    def defaults
      {view: View.new, board: Board.new, player_one: Player.new, player_two: Computer.new}
    end

end