class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :genre
      t.string :platform
      t.string :network
      t.integer :airtime

      t.timestamps
    end
  end
end
