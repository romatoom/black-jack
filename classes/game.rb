require_relative "player"
require_relative "dealer"
require_relative "deck"
require_relative "bank"
require_relative "../modules/helper_io"
require_relative "../modules/game_info"

# игровая механика
class Game
  extend HelperIO

  class << self
    include GameInfo

    attr_reader :player, :dealer, :deck, :bank

    # инициализация и старт игры
    def start(player_name)
      puts "Добро пожаловать в игру Black Jack, #{player_name}!"

      @player = Player.new(player_name)
      @dealer = Dealer.new
      @deck = Deck.new
      @bank = Bank.new

      loop do
        new_round
        break if player.cash < MINIMUM_RATE || dealer.cash < MINIMUM_RATE

        continue_game = input_value("Продолжить игру? Если согласны введите Y").downcase
        break unless continue_game == 'y'
      end
    end

    def new_round
      deck.snuffle

      2.times { player.take_card(deck) }
      2.times { dealer.take_card(deck) }

      round_end = false
      
      visualize

      until round_end do
        bank.get_a_bet(player, dealer)

        winner = player

        bank.pay_cache(winner)

        visualize

        player.return_cards(deck)
        dealer.return_cards(deck)

        round_end = true
      end

    end

    private

    attr_writer :player, :dealer, :deck, :bank
  end
end
