class Board

  attr_accessor :game_board

  def initialize(args)
    args = defaults.merge(args)
    @game_board = prep_board(args[:game_board])
  end

  def winner?
    board_check
  end

  def board_check
    return true if col_check || row_check || diagonal_check
    false
  end

  private
  # refactor this
    def prep_board(board)
      prepared_board = []
      board.each_slice(3) do |row|
        prepared_board << row
      end
      prepared_board
    end

    def col_check
      @game_board.transpose.each do |col|
        return true if col.uniq.length == 1
      end
      false
    end

    def row_check
      @game_board.each do |row|
        return true if row.uniq.length == 1
      end
      false
    end

    def diagonal_check
      left_right_diag = (0..2).collect {|i| @game_board[i][i]}
      right_left_diag = (0..2).collect {|i| @game_board.reverse[i][i]}
      return true if left_right_diag.uniq.length == 1 || right_left_diag.uniq.length == 1
      false
    end

    def defaults
      {game_board: %w(1 2 3 4 5 6 7 8 9)}
    end

end