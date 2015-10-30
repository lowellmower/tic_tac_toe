require_relative 'player'
class ComputerPlayer < Player

  attr_accessor :name, :piece, :current_move, :opponent, :difficulty

  def initialize(args = {})
    args = defaults.merge(args)
    @difficulty = args[:difficulty]
    @opponent = args[:opponent]
    @piece = args[:piece]
    @current_move = nil
  end

  def score(depth, board)
    return 10 - depth if board.winner == @piece
    return depth - 10 if board.winner == @opponent
    tie = 0
  end

  def best_move(scores, moves, bool)
    if bool
      max_score_idx = scores.each_with_index.max[1]
      @current_move = moves[max_score_idx]
      return scores[max_score_idx]
    end
    min_score_idx = scores.each_with_index.min[1]
    @current_move = moves[min_score_idx]
    return scores[min_score_idx]
  end

  def minimax(board, depth, bool)
    return score(depth, board) if board.winner?
    scores = []
    moves = []
    board.available_moves.each do |pos_move|
      board.accept_piece(pos_move, @piece) if bool
      board.accept_piece(pos_move, @opponent) if !bool
      scores << minimax(board, depth + 1, false) if bool
      scores << minimax(board, depth + 1, true) if !bool
      moves << pos_move
      board.revert_move(pos_move)
    end
    best_move(scores, moves, bool)
  end

  def make_move(board)
    minimax(board, board.move_count, true)
    board.accept_piece(@current_move, @piece)
    sleep 1
  end

  private

    def defaults
      {name: "Computer", difficulty: "hard", piece: "O", opponent: "X"}
    end

end