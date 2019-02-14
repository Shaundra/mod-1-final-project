class Game < ActiveRecord::Base
  has_many :game_records
  belongs_to :player

  def create_question_set(question_ct)
    questions = []
    question_ct.times { questions << generate_question }
    questions
  end

  def generate_question
    question = {song_id: nil, guessing_lyric: nil, correct_answer: nil, incorrect_answers: [], display_answers: []}

    song = Song.all.sample
    question[:song_id] = song[:id]
    question[:guessing_lyric] = choose_lyrics_line(lyrics_to_array(song)).join("\n")
    question[:correct_answer] = song.artist.name
    3.times { question[:incorrect_answers] << choose_random_artist(song) }
    question[:display_answers] = question[:incorrect_answers]
    question[:display_answers] << question[:correct_answer]
    question[:display_answers].shuffle!

    question
  end

  def choose_random_artist(song)
    rand_artist = Artist.all.sample
    if rand_artist.name == song.artist.name
      choose_random_artists(song)
    else
      rand_artist.name
    end
  end

  def lyrics_to_array(song)
    song["lyrics"].split("\r\n").delete_if { |line| line.empty? }
  end

  def choose_lyrics_line(lyrics_array)
    random_index = rand(lyrics_array.size - 1)
    random_index -= 1 if random_index == lyrics_array.size - 1
    lyrics_array[random_index..(random_index + 1)]
  end

  def ask_questions(question_ct)
    question_set = create_question_set(question_ct)

    question_set.each do |question|
      display_question(question)
      response = STDIN.gets.chomp.to_i
      response_artist = question[:display_answers][response - 1]
      display_correct_answer_and_score(question, response_artist)
    end
  end

  def display_question(question)
    puts "
    Who sang these lyrics?\n
    #{question[:guessing_lyric]}"
    question[:display_answers].each_with_index { |answer, i| puts "#{i + 1}. #{answer}" }
  end

  def score_response(player_response, answer)
    player_response == answer ? 10 : 0
  end

  def save_answered_question(question)
    save = GameRecord.create
    save.song_id = question[:song_id]
    save.points = score_response(response, question[:correct_answer])
    save.game_id = self.id
  end

  def display_correct_answer_and_score(question, response)
    puts "\nThe correct answer is #{question[:correct_answer]}"
    puts "You scored #{self.game_records.points} points!\n\n"
  end

end
