class Game < ActiveRecord::Base
  has_many :game_records
  belongs_to :player
end
