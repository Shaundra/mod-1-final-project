class Player < ActiveRecord::Base
  has_many :game_histories
end
