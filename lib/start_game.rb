require_relative 'models/board'
require_relative 'models/human_player'
require_relative 'models/computer_player'
require_relative 'views/view'
require_relative 'controllers/games_controller'

gc = GamesController.new
gc.initialize_game