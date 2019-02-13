class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.integer :artist_id
      t.string :title
      t.string :release_date
    end
  end
end