require_relative 'player'
class HumanPlayer < Player

  attr_accessor :name, :piece

  def initialize(args = {})
    args = defaults.merge(args)
  end

  def make_move(move, board)
    if valid_move?(move) && move_available?(move, board)
      place_piece(move, board) and return true
    end
    board.reject_piece
  end

  private

    def defaults
      {name: "Human Player", piece: "X"}
    end

end