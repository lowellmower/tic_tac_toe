class Player

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

end