require_relative "../modules/card_info"

# игральная карта
class Card
  include CardInfo

  def initialize(suit, value)
    @suit, @value = suit, value
    @hidden = true
  end

  def hidden?
    hidden
  end

  def showed?
    !hidden
  end

  def hide
    self.hidden = true
  end

  def show
    self.hidden = false
  end

  def image
    return "🂠" if hidden?
    "#{value}#{suit}"
  end

  private

  attr_accessor :hidden
  attr_reader :suit, :value
end
