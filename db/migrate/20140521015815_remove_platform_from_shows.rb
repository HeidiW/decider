class RemovePlatformFromShows < ActiveRecord::Migration
  def change
  	remove_column :shows, :platform
  end
end
