# участник игры (класс-родитель для игрока и дилера)
class MemberOfGame
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  attr_writer :name
end
