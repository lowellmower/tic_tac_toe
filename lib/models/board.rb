require 'pry'
class Board

  attr_accessor :game_board, :board, :winner, :move_count

  def initialize(args = {})
    args = defaults.merge(args)
    @game_board = args[:game_board]
    @board = prep_board(@game_board)
    @winner = nil
    @move_count = 0
  end

  def accept_piece(move, piece)
    move = move.to_i
    move -= 1
    @game_board[move] = piece
    @board = prep_board(@game_board)
    @move_count += 1
  end

  def revert_move(move)
    @game_board[(move.to_i - 1)] = move
    @board = prep_board(@game_board)
    @move_count -= 1
  end

  def reject_piece
    nil
  end

  def winner?
    board_check
  end

  def board_check
    return true if col_check || row_check || diagonal_check || tie?
    false
  end

  def to_s
    @board.map {|row| row.join(' | ') }.join("\n----------\n")
  end

  def move_available?(move)
    return true if @game_board.include?(move)
    false
  end

  def available_moves
    @game_board.select{|x| x =~ /[1-9]/}
  end

  private

    def prep_board(board)
      matrix_board = []
      board.each_slice(3) do |row|
        matrix_board << row
      end
      matrix_board
    end

    def col_check
      @board.transpose.each do |col|
        if col.uniq.length == 1
          @winner = col.uniq[0]
          return true
        end
      end
      false
    end

    def row_check
      @board.each do |row|
        if row.uniq.length == 1
          @winner = row.uniq[0]
          return true
        end
      end
      false
    end

    def diagonal_check
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

    def tie?
      if @game_board.all? {|x| x == "X" || x == "O"}
        @winner = "Tie!"
        return true
      end
      false
    end

    def defaults
      {game_board: %w(1 2 3 4 5 6 7 8 9)}
    end

end