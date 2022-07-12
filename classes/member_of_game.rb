require_relative "deck"
require_relative "bank"
require_relative "../modules/game_info"

# участник игры (класс-родитель для игрока и дилера)
class MemberOfGame
  include GameInfo

  attr_reader :name, :cards, :cash

  def initialize(name)
    @name = name
    @cash = INITIAL_CASH
    @cards = []
  end

  def take_card(deck)
    card = deck.pop
    card.make_visible if self.instance_of?(Player)
    cards << card
  end

  def return_cards(deck)
    while (cards.length.positive?) do
      card = cards.pop
      card.hide
      deck.push(card)
    end
  end

  def cash_up(summ)
    self.cash += summ
  end

  def cash_down(summ)
    self.cash -= summ
  end

  def score
    
  end

  private

  attr_writer :name, :cards, :cash
end
