class View

  attr_accessor :input, :output

  def initialize
    @input = $stdin
    @output = $stdout
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

  def move_error
    @output.puts "\nInvalid move. Select number on board.\n"
  end

end