require_relative "player"
require_relative "dealer"
require_relative "deck"

# игровая механика
class Game
  class << self
    attr_reader :player, :dealer, :deck

    # инициализация и старт игры
    def start(player_name)
      puts "Добро пожаловать в игру Black Jack, #{player_name}!"

      @player = Player.new(player_name)
      @dealer = Dealer.new
      @deck = Deck.new

      new_round
    end

    def new_round
      deck.snuffle
    end

    private

    attr_writer :player, :dealer, :deck
  end
end
