class Game < ActiveRecord::Base
  has_many :game_records
  belongs_to :player

  def create_question_set

  end

  def score_response
    
  end

end
