class View

  attr_accessor :input, :output, :start_info

  def initialize
    @input = $stdin
    @output = $stdout
    @start_info = {}
  end

  def prompt
    @input = gets.chomp
  end

  def welcome_message
    output.puts "*****************\n** TAC TOC TIE **\n*****************"
  end

  def clear
    output.puts "\e[H\e[2J"
  end

  def display(msg)
    @output.puts msg
  end

  # def enter_move
  #   @output.puts "\nSelect number to place piece:\n"
  #   prompt
  # end

  def move_error
    @output.puts "\nInvalid move. Select number on board.\n"
  end

end