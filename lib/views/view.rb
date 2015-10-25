class View

  attr_accessor :input, :output

  def initialize
    @input = $stdin
    @output = $stdout
  end

  def prompt
    @input = gets.chomp
  end

  def welcome
    output.puts "*****************\n** TAC TOC TIE **\n*****************"
  end

  def clear
    output.puts "\e[H\e[2J"
  end

  def display(msg)
    @output.puts msg
  end

  def enter_move
    @output.puts "\nSelect Number to Place Piece:\n"
    prompt
  end

end