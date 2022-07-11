require_relative "card"
require_relative "../modules/card_info"

# колода карт
class Deck
  attr_reader :cards

  def initialize
    @cards = []
    CardInfo::SUITS.each do |suit|
      CardInfo::VALUES.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  # перетасовать колоду
  def snuffle
    cards.shuffle!
  end

  def pull
    cards.pull
  end

  def push(card)
    cards << card
  end

  def show
    cards.each do |card|
      puts card.image
    end
  end

  private

  attr_writer :cards
end
