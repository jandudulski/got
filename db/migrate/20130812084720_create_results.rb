class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :game_id
      t.integer :house_id
      t.integer :player_id
      t.integer :position

      t.timestamps
    end
    add_index :results, :game_id
    add_index :results, :house_id
    add_index :results, :player_id

    add_index :results, [:game_id, :house_id], unique: true
    add_index :results, [:game_id, :player_id], unique: true
    add_index :results, [:house_id, :player_id], unique: true
  end
end
