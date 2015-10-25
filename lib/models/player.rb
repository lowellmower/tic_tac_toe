class Player

  attr_accessor :name, :piece

  def initialize(args = {})
    args = defaults.merge(args)
    @name = args[:name]
    @piece = args[:piece]
  end

  def make_move(move, board)
    move = move.to_i
    if valid_move?(move) && move_available?(move, board)
      move -= 1
      place_piece(move, board) and return
      # prompt controller to update view comm
    end
    board.reject_piece
  end


  private

    def place_piece(move, board)
      board.move_piece(move, @piece)
    end

    def move_available?(move, board)
      return false unless board.game_board.include?(move.to_s)
      true
    end

    def valid_move?(move)
      return false unless move.is_a? Integer
      return false if move > 9 || move < 1
      true
    end

    def defaults
      {name: "Human Player", piece: "X"}
    end

end