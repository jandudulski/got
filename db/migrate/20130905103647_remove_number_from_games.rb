class RemoveNumberFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :number
  end

  def down
    add_column :games, :number, :integer
  end
end
