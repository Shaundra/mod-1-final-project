class CreateGameRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :gamerecords do |t|
      t.integer :game_id
      t.integer :song_id
      t.integer :points
    end
  end
end
