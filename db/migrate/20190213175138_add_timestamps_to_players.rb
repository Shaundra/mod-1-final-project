class AddTimestampsToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_table(:players) { |t| t.timestamps }
  end
end
