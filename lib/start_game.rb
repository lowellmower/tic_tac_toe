require 'pry'
require_relative 'models/board'
require_relative 'models/player'
require_relative 'models/computer'
require_relative 'views/view'
require_relative 'controllers/games_controller'

gc = GamesController.new
gc.play_game