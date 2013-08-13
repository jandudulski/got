class AddNumberOfPlayersToGameVersions < ActiveRecord::Migration
  def change
    add_column :game_versions, :min_players, :integer
    add_column :game_versions, :max_players, :integer
  end
end
