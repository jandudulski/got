class RemoveReduntantIndex < ActiveRecord::Migration
  def change
    remove_index :results, [:house_id, :player_id]
  end
end
