require_relative 'member_of_game'

# дилер
class Dealer < MemberOfGame
  def initialize
    super("Дилер")
  end
end
