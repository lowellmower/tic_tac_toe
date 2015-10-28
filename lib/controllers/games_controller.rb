require 'pry'
class GamesController

  attr_accessor :board, :player_one, :player_two
  attr_reader :view

  def initialize(args = {})
    args = defaults.merge(args)
    @view = args[:view]
    @board = args[:board]
    @player_one = args[:player_one]
    @player_two = args[:player_two]
  end

  def play_game
    clear_and_welcome
    view.display "\nPlease select play type:\n1. Person vs. Person\n2. Person vs. Computer\n3. Computer vs. Computer"
    view.prompt
    result = case view.input
      when "1" then init_pvp
      when "2" then init_pvc
      when "3" then init_cvc
      else play_game
    end
    clear_and_welcome
    who_first?
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
    view.display "\n#{player.name.upcase}'s MOVE ('#{player.piece}')\nSelect number to place piece:"
    view.prompt
  end

  private

    def clear_and_welcome
      view.clear
      view.welcome_message
    end

    def set_view
      clear_and_welcome
      view.display(@board.to_s)
    end

    def who_first?
      view.display "Who Goes first?\n1. X\n2. O"
      view.prompt
      result = case view.input
        when "1" then play_game_x
        when "2" then play_game_o
        else who_first?
      end
      clear_and_welcome
      set_view
    end

    def play_game_o
      until board.winner?
        set_view
        player_or_human_move(player_two)
        break if @board.winner?
        set_view
        player_or_human_move(player_one)
        break if @board.winner?
      end
    end

    def play_game_x
      until board.winner?
        set_view
        player_or_human_move(player_one)
        break if @board.winner?
        set_view
        player_or_human_move(player_two)
        break if @board.winner?
      end
    end

    def player_or_human_move(player)
      if player.class == HumanPlayer
        get_move(player)
        validate_move(player)
        player.make_move(view.input, board)
      elsif player.class == ComputerPlayer
        view.display "#{player.name} thinking..."
        player.make_move(board)
      end
    end

    def name_and_piece(player)
      view.prompt
      player.name = view.input
      clear_and_welcome
      prompt_for_piece(player)
    end

    def prompt_for_piece(player)
      view.display "Please enter #{player.name}'s Piece:\n1. X\n2. O"
      view.prompt
      result = case view.input
        when "1" then player.piece = "X"
        when "2" then player.piece = "O"
        else prompt_for_piece(player)
      end
      clear_and_welcome
    end

    def init_pvp
      clear_and_welcome
      view.display "Please enter Player One's Name\n"
      name_and_piece(player_one)
      self.player_two = HumanPlayer.new
      view.display "Please enter Player Two's Name\n"
      name_and_piece(player_two)
    end

    def init_pvc
      clear_and_welcome
      view.display "Please enter Player One's Name\n"
      name_and_piece(player_one)
      self.player_two = ComputerPlayer.new
      view.display "Please enter Copmuter's Name\n"
      name_and_piece(player_two)
    end

    def init_cvc
      self.player_one = ComputerPlayer.new
      clear_and_welcome
      view.display "Please enter Computer One's Name\n"
      name_and_piece(player_one)
      self.player_two = ComputerPlayer.new(opponent: player_one.piece)
      view.display "Please enter Copmuter Two's Name\n"
      name_and_piece(player_two)
      player_one.opponent = player_two.piece
    end

    def defaults
      {view: View.new, board: Board.new, player_one: HumanPlayer.new, player_two: ComputerPlayer.new}
    end

end