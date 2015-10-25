require_relative 'player'

class Computer < Player

  attr_accessor :name, :difficulty, :piece

  def initialize(args = {})
    args = defaults.merge(args)
    @difficulty = args[:difficulty]
    @name = args[:name]
    @piece = args[:piece]
  end

  private

    def defaults
      {name: "Computer", difficulty: "hard", piece: "O"}
    end

end