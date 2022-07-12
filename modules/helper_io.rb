require_relative "../classes/game"
require_relative "../classes/member_of_game"
require_relative "game_info"

# Вспомогательные методы для ввода/вывода информации
module HelperIO
  private

  def input_value(text)
    puts text
    print "> "

    value = ""
    while value.empty? do
      value = gets.chomp
    end

    value
  end

  def divider
    "-" * 20
  end

  def visualize
    system "clear"
    visualize_bank
    visualize_member_of_game(Game.dealer)
    visualize_member_of_game(Game.player)
  end

  def visualize_bank
    puts divider
    puts "Банк: #{Game.bank.cash}$"
    puts divider
    puts
  end

  def visualize_member_of_game(member)
    puts "#{member.name}"
    puts "На счету: #{member.cash}$"

    card_images = member.cards.empty? ? [] : member.cards.map(&:image)
    puts "Карты: #{card_images.join(" ")}"

    puts "\n\n"
  end

  def print_bye_message(reason)
    puts "Игра окончена"
    bye_messages = {
      player_no_cash: "У вас закончились деньги, чтобы сделать ставку",
      dealer_no_cash: "У дилера закончились деньги, чтобы сделать ставку",
      player_stop_game: "Вы решили остановить игру"
    }

    puts bye_messages[reason]
    puts

    print_results_of_game
    puts "До скорых встреч, #{Game.player.name}!"
  end

  def print_results_of_game
    puts "Ваш игровой счёт по итогу игры составил #{Game.player.cash} $"
    delta_cash = Game.player.cash - GameInfo::INITIAL_CASH
    return puts "Поздравляем, вы заработали #{delta_cash} $" if delta_cash.positive?
    return puts "Увы, но вы проиграли #{delta_cash} $" if delta_cash.negative?
    puts "Что было в карманах, то и осталось. Зато мы прекрасно провели время за игрой"
  end
end
