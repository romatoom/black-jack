# Вспомогательные методы для ввода/вывода информации
module HelperIO
  def input_player_name
    puts "Как вас зовут?"

    player_name = ""
    while player_name.empty? do
      player_name = gets.chomp
    end

    player_name
  end
end
