class Board

  attr_accessor :game_board, :board, :winner

  def initialize(args = {})
    args = defaults.merge(args)
    @game_board = args[:game_board]
    @board = prep_board(@game_board)
    @winner = nil
  end

  def move_piece(move, piece)
    @game_board[move] = piece
    @board = prep_board(@game_board)
    # remove messaging and abstract into controller
    p "quality move"
  end

  def reject_piece
    # should return nil and propmt controller to communicate invalid move
    p "sorry friend"
  end

  def winner?
    board_check
  end

  def board_check
    return true if col_check || row_check || diagonal_check
    false
  end

  def to_s
    @board.map {|row| row.join(' | ') }.join("\n----------\n")
  end

  private
  # refactor this
    def prep_board(board)
      matrix_board = []
      board.each_slice(3) do |row|
        matrix_board << row
      end
      matrix_board
    end

    def col_check
      @board.transpose.each do |col|
        @winner = col.uniq[0]
        return true if col.uniq.length == 1
      end
      false
    end

    def row_check
      @board.each do |row|
        @winner = row.uniq[0]
        return true if row.uniq.length == 1
      end
      false
    end

    def diagonal_check
      # refactor this
      left_right_diag = (0..2).collect {|i| @board[i][i]}
      right_left_diag = (0..2).collect {|i| @board.reverse[i][i]}
      if left_right_diag.uniq.length == 1
        @winner = left_right_diag.uniq[0]
        return true
      elsif right_left_diag.uniq.length == 1
        @winner = right_left_diag.uniq[0]
        return true
      end
      false
    end

    def defaults
      {game_board: %w(1 2 3 4 5 6 7 8 9)}
    end

end