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
    score_value = 0
    cards.each do |card|
      score_value += card.value.to_i if NUMERIC_CARDS.include?(card.value)
      score_value += 10 if PICTURE_CARDS.include?(card.value)
      score_value += score_for_ace_card(score_value) if card.value == 'A'
    end
    score_value
  end

  def score_for_ace_card(current_score)
    max_score_with_ace = current_score + MAX_VALUE_FOR_ACE
    return MAX_VALUE_FOR_ACE if max_score_with_ace <= WIN_SCORE
    MIN_VALUE_FOR_ACE
  end

  private

  attr_writer :name, :cards, :cash
end
