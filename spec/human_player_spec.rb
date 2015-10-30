require_relative 'spec_helper'
require 'pry'
describe HumanPlayer do
  let(:player) { HumanPlayer.new }
  let(:board) { Board.new }

  it "is an instance of the HumanPlayer class" do
    expect(player.class).to eq(HumanPlayer)
  end

  it "has a name which can be set" do
    player.name = "Lowell"
    expect(player.name).to eq("Lowell")
  end

  it "has a piece which can be set" do
    player.name = "O"
    expect(player.name).to eq("O")
  end

  it "has a name which can be set" do
    player.name = "Lowell"
    expect(player.name).to eq("Lowell")
  end

  it "has the ability to make a valid move" do
    expect(player.make_move('1', board)).to eq(true)
  end

  it "will reject a non valid move" do
    expect(player.make_move('10', board)).to eq(nil)
  end

  it "inherits from a parent, Player class" do
    expect(player.class.superclass).to eq(Player)
  end

  it "can validate a move correct move with parent method" do
    expect(player.valid_move?("1")).to eq(true)
  end

  it "can invalidate an incorrect move with parent method" do
    expect(player.valid_move?("10")).to eq(false)
  end

end