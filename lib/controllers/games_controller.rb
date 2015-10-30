class GamesController
  attr_accessor :board, :player_one, :player_two
  attr_reader :view
  def initialize(args = {})
    args = defaults.merge(args)
    @view = args[:view]
    @board = args[:board]
    @player_one = args[:player_one]
    @player_two = args[:player_two]
    @player_arr = []
  end

  def initialize_game
    set_view
    view.display "\nPlease select play type:\n1. Person vs. Person\n2. Person vs. Computer\n3. Computer vs. Computer"
    view.prompt
    result = case view.input
      when "1" then init_pvp
      when "2" then init_pvc
      when "3" then init_cvc
      else play_game
    end
    set_view
    who_first?
    play_game
    view.display "Winner is: #{board.winner}"
  end

  private

    def get_move(player)
      view.display "\n#{player.name.upcase}'s MOVE ('#{player.piece}')\nSelect number to place piece:"
      view.prompt
    end

    def set_view
      view.clear
      view.welcome_message
      view.display(@board.to_s)
    end

    def who_first?
      view.display "Who Goes first?\n1. #{player_one.name}\n2. #{player_two.name}"
      view.prompt
      result = case view.input
        when "1" then @player_arr
        when "2" then @player_arr.reverse!
        else who_first?
      end
      set_view
    end

    def play_game
      until board.winner?
        player_or_human_move(@player_arr[0])
        set_view
        break if @board.winner?
        player_or_human_move(@player_arr[1])
        set_view
        break if @board.winner?
      end
    end

    def player_or_human_move(player)
      set_view
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
      set_view
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
      set_view
    end

    def validate_move(player)
      until player.valid_move?(view.input) && board.move_available?(view.input)
        set_view
        view.display "**You must select an avialable number on the board**"
        get_move(player)
      end
    end

    def init_pvp
      set_view
      view.display "Please enter Player One's Name\n"
      name_and_piece(player_one)
      self.player_two = HumanPlayer.new
      view.display "Please enter Player Two's Name\n"
      name_and_piece(player_two)
      @player_arr.push(player_one, player_two)
    end

    def init_pvc
      set_view
      view.display "Please enter Player One's Name\n"
      name_and_piece(player_one)
      self.player_two = ComputerPlayer.new
      view.display "Please enter Copmuter's Name\n"
      name_and_piece(player_two)
      player_two.opponent = player_one.piece
      @player_arr.push(player_one, player_two)
    end

    def init_cvc
      set_view
      self.player_one = ComputerPlayer.new
      view.display "Please enter Computer One's Name\n"
      name_and_piece(player_one)
      self.player_two = ComputerPlayer.new(opponent: player_one.piece)
      view.display "Please enter Copmuter Two's Name\n"
      name_and_piece(player_two)
      player_one.opponent = player_two.piece
      player_two.opponent = player_one.piece
      @player_arr.push(player_one, player_two)
    end

    def defaults
      {view: View.new, board: Board.new, player_one: HumanPlayer.new, player_two: ComputerPlayer.new}
    end

end