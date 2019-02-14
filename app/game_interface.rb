class GameInterface
  def self.welcome
    puts '
    _____
   |   __|_ _ ___ ___ ___
   |  |  | | | -_|_ -|_ -|
   |_____|___|___|___|___|
    _____
   |   __|___ ___ _____
   |   __|  _| . |     |
   |__|  |_| |___|_|_|_|
    __            _
   |  |   _ _ ___|_|___ ___
   |  |__| | |  _| |  _|_ -|
   |_____|_  |_| |_|___|___|
         |___|
   '
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
    when '1'
      current_player = ask_player_name
      play_game(current_player)
      continue(current_player)
    when '2' then Game.display_leaderboard
    when '0' then abort('Thank you for playing')
    else get_menu_input('try again')
    end
  end

  def self.play_game(current_player)
    new_game = Game.create
    new_game.player = current_player
    new_game.save
    new_game.ask_questions(3)
    new_game.show_ending_game_score
  end

  def self.ask_player_name
    puts "Who are you? Have we met before?"
    player_name = gets.chomp
    current_player = Player.find_or_create_by(name: player_name)
    puts "Nice to see you #{current_player.name}. Let's get started."
    current_player
  end

  def self.continue(current_player)
    loop do
      puts "Would you like to start a new game, #{current_player.name}? [Y/N]"
      input = gets.chomp.downcase

      if input == "y"
        play_game(current_player)
      else
        break
      end
    end
  end

end
