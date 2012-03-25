class AddImageRemoteUrlToPhotos < ActiveRecord::Migration
  def change
  	add_column :items, :image_remote_url, :string
  end
end
