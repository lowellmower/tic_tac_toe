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
    output.puts "**T][C T@C T0E**"
  end

  def clear
    output.puts "\e[H\e[2J"
  end

  def display(msg)
    @output.puts msg
  end

  def enter_move
    @output.puts "Please select a number space:\n"
    prompt
  end

end