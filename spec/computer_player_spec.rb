require_relative 'spec_helper'

describe ComputerPlayer do

  let(:computer) { ComputerPlayer.new }
  let(:board) { Board.new }

  it "it has a default difficulty of hard" do
    expect(computer.difficulty).to eq("hard")
  end

  it "has an a default piece of O" do
    expect(computer.piece).to eq("O")
  end

  it "has an opponent piece which is not it's own" do
    expect(computer.opponent).not_to eq(computer.piece)
  end

  it "has a default current move of nil" do
    expect(computer.current_move).to eq(nil)
  end

  it "can validate a move correct move" do
    expect(computer.valid_move?("1")).to eq(true)
  end

  it "can invalidate an incorrect move" do
    expect(computer.valid_move?("10")).to eq(false)
  end

  it "can return -10 score if depth 0 and computer lose" do
    board.winner = "X"
    expect(computer.score(0, board)).to eq(-10)
  end

  it "can return 10 score if depth 0 and computer wins" do
    board.winner = "O"
    expect(computer.score(0, board)).to eq(10)
  end

  it "can return score 0 if depth 0 there is a tie" do
    board.winner = "Tie"
    expect(computer.score(0, board)).to eq(0)
  end

  it "can return -9 score if depth 1 and computer lose" do
    board.winner = "X"
    expect(computer.score(1, board)).to eq(-9)
  end

  it "can return 9 score if depth 1 and computer wins" do
    board.winner = "O"
    expect(computer.score(1, board)).to eq(9)
  end

  it "can return -8 score if depth 2 and computer lose" do
    board.winner = "X"
    expect(computer.score(2, board)).to eq(-8)
  end

  it "can return 8 score if depth 2 and computer wins" do
    board.winner = "O"
    expect(computer.score(2, board)).to eq(8)
  end

  it "can return -7 score if depth 3 and computer lose" do
    board.winner = "X"
    expect(computer.score(3, board)).to eq(-7)
  end

  it "can return 7 score if depth 3 and computer wins" do
    board.winner = "O"
    expect(computer.score(3, board)).to eq(7)
  end

  it "can return -6 score if depth 4 and computer lose" do
    board.winner = "X"
    expect(computer.score(4, board)).to eq(-6)
  end

  it "can return 6 score if depth 4 and computer wins" do
    board.winner = "O"
    expect(computer.score(4, board)).to eq(6)
  end

  it "can return -5 score if depth 5 and computer lose" do
    board.winner = "X"
    expect(computer.score(5, board)).to eq(-5)
  end

  it "can return 5 score if depth 5 and computer wins" do
    board.winner = "O"
    expect(computer.score(5, board)).to eq(5)
  end

  it "can return -4 score if depth 6 and computer lose" do
    board.winner = "X"
    expect(computer.score(6, board)).to eq(-4)
  end

  it "can return 4 score if depth 6 and computer wins" do
    board.winner = "O"
    expect(computer.score(6, board)).to eq(4)
  end

  it "can return -3 score if depth 7 and computer lose" do
    board.winner = "X"
    expect(computer.score(7, board)).to eq(-3)
  end

  it "can return 3 score if depth 7 and computer wins" do
    board.winner = "O"
    expect(computer.score(7, board)).to eq(3)
  end

  it "can return -2 score if depth 8 and computer lose" do
    board.winner = "X"
    expect(computer.score(8, board)).to eq(-2)
  end

  it "can return 2 score if depth 8 and computer wins" do
    board.winner = "O"
    expect(computer.score(8, board)).to eq(2)
  end

  it "can return -1 score if depth 9 and computer lose" do
    board.winner = "X"
    expect(computer.score(9, board)).to eq(-1)
  end

  it "can return 1 score if depth 9 and computer wins" do
    board.winner = "O"
    expect(computer.score(9, board)).to eq(1)
  end

  it "should select the best move with the highest score" do
    scores = [9,5,1]
    moves  = [2,5,6]
    expect(computer.best_move(scores,moves,true)).to eq(9)
    expect(computer.current_move).to eq(2)
  end

  it "should select the best move with the lowest score" do
    scores = [3,5,1]
    moves  = [4,2,6]
    expect(computer.best_move(scores,moves,false)).to eq(1)
    expect(computer.current_move).to eq(6)
  end

# need to spped up this test
  # it "should return 1 on an empty game board" do
  #   expect(computer.make_move(board)).to eq(1)
  # end

end