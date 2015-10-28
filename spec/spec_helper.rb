require_relative '../lib/models/computer_player'
require_relative '../lib/models/human_player'
require_relative '../lib/models/player'
require_relative '../lib/models/board'
require_relative '../lib/views/view'
require_relative '../lib/controllers/games_controller'

module Helpers
  def fake_stdin(*args)
    begin
      $stdin = StringIO.new
      $stdin.puts(args.shift) until args.empty?
      $stdin.rewind
      yield
    ensure
      $stdin = STDIN
    end
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
end