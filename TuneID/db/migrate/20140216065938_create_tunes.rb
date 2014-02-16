class CreateTunes < ActiveRecord::Migration
  def change
    create_table :tunes do |t|
      t.string :artist
      t.string :album
      t.string :title

      t.timestamps
    end
  end
end
