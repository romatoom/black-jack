require_relative "classes/game"
require_relative "modules/helper_io"

extend HelperIO

player_name = input_value("Как вас зовут?")

Game.start(player_name)
