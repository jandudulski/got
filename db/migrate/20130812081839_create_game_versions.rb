class CreateGameVersions < ActiveRecord::Migration
  def change
    create_table :game_versions do |t|
      t.string :name

      t.timestamps
    end
  end
end
