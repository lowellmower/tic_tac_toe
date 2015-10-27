class Player

  attr_accessor :name, :piece

  def initialize(args = {})
    args = defaults.merge(args)
    @name = args[:name]
    @piece = args[:piece]
  end

  def make_move(move, board)
    if valid_move?(move) && move_available?(move, board)
      place_piece(move, board) and return true
    end
    board.reject_piece
  end

  def valid_move?(move)
    return false if move == ("X" || "O")
    return false if move.to_i > 9 || move.to_i < 1
    true
  end

  private

    def place_piece(move, board)
      board.accept_piece(move, @piece)
    end

    def move_available?(move, board)
      return false unless board.game_board.include?(move.to_s)
      true
    end

    def defaults
      {name: "Human Player", piece: "X"}
    end

end