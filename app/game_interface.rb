class GameInterface
  def welcome
    puts "Welcome message! With things you can do"
  end

  def find_player(player_name)
    Player.find_or_create_by(player_name)
  end

  def display_menu

  end
end
