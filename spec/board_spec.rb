require_relative 'spec_helper'

describe Board do

  let(:board) { Board.new }

  it "is initialized with a default game board" do
    expect(board.game_board).to eq(%w(1 2 3 4 5 6 7 8 9))
  end

  it "is initialized with no winner" do
    expect(board.winner).to eq(nil)
  end

  it "is initialized with a move count of 0" do
    expect(board.move_count).to eq(0)
  end

  it "is initialized with a two dimensional array as a matrix board" do
    expect(board.board).to eq([["1","2","3"],["4","5","6"],["7","8","9"]])
  end

  it "can accept a piece as a move" do
    board.accept_piece(1,"X")
    expect(board.game_board[0]).to eq("X")
    expect(board.move_count).to eq(1)
  end

  it "can revert a move" do
    board.accept_piece(1,"X")
    expect(board.game_board[0]).to eq("X")
    expect(board.move_count).to eq(1)
    board.revert_move("1")
    expect(board.game_board[0]).to eq("1")
    expect(board.move_count).to eq(0)
  end

  it "can reject a piece" do
    expect(board.reject_piece).to eq(nil)
  end

  it "can check for a winner" do
    expect(board.winner?).to eq(false)
    board.board = [["X","2","3"],["4","X","6"],["7","8","X"]]
    expect(board.winner?).to eq(true)
  end

  it "can send a board to be viewed" do
    expect(board.to_s).to eq("1 | 2 | 3\n----------\n4 | 5 | 6\n----------\n7 | 8 | 9")
  end

  it "can check itself to see if a move is available" do
    9.times do
      i = 1
      expect(board.move_available?(i.to_s)).to eq(true)
      i += 1
    end
    expect(board.move_available?(10)).to eq(false)
    expect(board.move_available?(0)).to eq(false)
  end

  it "can get a list of available moves" do
    expect(board.available_moves).to eq(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
  end

end