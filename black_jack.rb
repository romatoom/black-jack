require_relative "classes/game"
require_relative "modules/helper_io"

extend HelperIO

player_name = input_player_name

Game.start(player_name)
