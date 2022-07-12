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

      continue_game = true
      while continue_game
        new_round

        continue_game, reason = continue_game?
      end

      reason =
      print_bye_message(reason)
    end

    private

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

    def can_player_get_a_bet?
      player.cash >= MINIMUM_RATE
    end

    def can_dealer_get_a_bet?
      dealer.cash >= MINIMUM_RATE
    end

    def continue_game?
      return [false, :player_no_cash] unless can_player_get_a_bet?
      return [false, :dealer_no_cash] unless can_dealer_get_a_bet?

      continue_game = input_value("Продолжить игру? Если согласны введите Y").downcase

      return [false, :player_stop_game] unless continue_game == 'y'
      [true, nil]
    end

    attr_writer :player, :dealer, :deck, :bank
  end
end
