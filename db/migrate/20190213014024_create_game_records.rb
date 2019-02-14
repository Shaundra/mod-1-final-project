class CreateGameRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :game_records do |t|
      t.references :game_id
      t.references :song_id
      t.integer :points
    end
  end
end
