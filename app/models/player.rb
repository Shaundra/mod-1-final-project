class Player < ActiveRecord::Base
  has_many :games
  has_many :game_records, through: :games
end
