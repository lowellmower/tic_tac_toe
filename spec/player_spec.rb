require_relative 'spec_helper'

describe Player do
  let(:player) { Player.new }

  it "can be initialized without a name" do
    expect(player.name).to eq(nil)
  end

  it "can be initialized with a name" do
    new_player = Player.new(name: "Lowell")
    expect(new_player.name).to eq("Lowell")
  end

  it "can be initialized without a piece" do
    expect(player.piece).to eq(nil)
  end

  it "can be initialized with a piece" do
    new_player = Player.new(piece: "X")
    expect(new_player.piece).to eq("X")
  end

  it "can validate a move correct move" do
    expect(player.valid_move?("1")).to eq(true)
  end

  it "can invalidate an incorrect move" do
    expect(player.valid_move?("10")).to eq(false)
  end


end