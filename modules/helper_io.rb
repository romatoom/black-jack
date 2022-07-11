require_relative "../classes/game"
require_relative "../classes/member_of_game"

# Вспомогательные методы для ввода/вывода информации
module HelperIO
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
end
