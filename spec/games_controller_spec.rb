require_relative 'spec_helper'

describe GamesController do

  let(:game_controller) { GamesController.new }
  let(:board) { Board.new }
  let(:player_one) { HumanPlayer.new }
  let(:player_two) { ComputerPlayer.new }
  let(:view) {view.new}

  it "should default to have a human player as player one" do
    expect(game_controller.player_one.class).to eq(HumanPlayer)
  end

  it "should default to have a computer player as player two" do
    expect(game_controller.player_two.class).to eq(ComputerPlayer)
  end

  it "should default to have a board" do
    expect(game_controller.board.class).to eq(Board)
  end

  it "should default to have a view" do
    expect(game_controller.view.class).to eq(View)
  end


end