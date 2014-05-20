class ChangeTimeFormatInMyTable < ActiveRecord::Migration
  def up
  	remove_column :shows, :airtime
  	add_column :shows, :airtime, :datetime 
  end

  def down
  	remove_column :shows, :airtime
  	add_column :shows, :airtime, :integer 
  end
end