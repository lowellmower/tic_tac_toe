require_relative 'player'
class ComputerPlayer < Player

  attr_accessor :name, :difficulty, :piece, :current_move

  def initialize(args = {})
    args = defaults.merge(args)
    @difficulty = args[:difficulty]
    @name = args[:name]
    @piece = args[:piece]
    @oppponent = args[:oppponent]
    @current_move
  end

  def score(depth, board)
    return 10 - depth if board.winner == @piece
    return depth - 10 if board.winner == @oppponent
    tie = 0
  end

  def best_move(scores, moves, bool)
    if bool
      max_score_idx = scores.each_with_index.max[1]
      @current_move = moves[max_score_idx]
      return scores[max_score_idx]
    else
      min_score_idx = scores.each_with_index.min[1]
      @current_move = moves[min_score_idx]
      return scores[min_score_idx]
    end
  end

  def minimax(board, depth, bool)
    return score(depth, board) if board.winner? || depth == 8
    scores = []
    moves = []
    board.available_moves.each do |pos_move|
      board.accept_piece(pos_move, @piece) if bool
      board.accept_piece(pos_move, @oppponent) if !bool
      scores << minimax(board, depth+1, false) if bool
      scores << minimax(board, depth+1, true) if !bool
      moves << pos_move
      board.revert_move(pos_move)
    end
    best_move(scores, moves, bool)
  end

  def make_move(board)
    minimax(board, board.count, true)
    board.accept_piece(@current_move, @piece)
    sleep 1
  end

  private

    def defaults
      {name: "Computer", difficulty: "hard", piece: "O", oppponent: "X"}
    end

end