class GameInterface
<<<<<<< HEAD
  def welcome
    puts "Welcome message! With things you can do"
  end

  def find_player(player_name)
=======
  def self.welcome
    puts "Welcome message! With things you can do"
  end

  def self.find_player(player_name)
>>>>>>> shaundra-working-branch
    Player.find_or_create_by(player_name)
  end

  def display_menu

  end

  def self.menu
    puts '
          1 - New Game
          2 - Leaderboard
          0 - Exit Game
        '
    get_menu_input()
  end

  def self.get_menu_input(arg=nil)
    if arg == 'try again'
      puts 'Please input a command'
    end

    input = gets.chomp

    case input
    when '1' then puts 'start_game' #replace with start_game method
    when '2' then puts 'leaderboard' #replace with leaderboard method
    when '0' then abort('Thank you for playing')
    else get_menu_input('try again')
    end
  end
end
