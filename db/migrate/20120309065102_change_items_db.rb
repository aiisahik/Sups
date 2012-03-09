class ChangeItemsDb < ActiveRecord::Migration

  def up
  	change_column :items, :description, :string
    rename_column :items, :image_link, :note
  end

  def down
  	rename_column :items, :note, :image_link
  	change_column :items, :description, :integer
  end
end