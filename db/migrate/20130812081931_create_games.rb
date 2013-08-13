class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :number
      t.integer :game_version_id
      t.text :comment

      t.timestamps
    end

    add_index :games, :number, unique: true
    add_index :games, :game_version_id
  end
end
