class Starred < ActiveRecord::Migration
  def up
  	add_column :items, :starred, :boolean, :default => 0
  end

  def down
  	remove_column :items, :starred
  end
end
