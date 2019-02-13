class CreateGameRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :gamerecords do |t|
      t.references :game_id
      t.references :song_id
      t.integer :points
    end
  end
end
