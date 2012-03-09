class AddAttachPaperclip < ActiveRecord::Migration
  def up
  	add_column :items, :attach_file_name,    :string
    add_column :items, :attach_content_type, :string
    add_column :items, :attach_file_size,    :integer
    add_column :items, :attach_updated_at,   :datetime
  end

  def down
  	remove_column :items, :attach_file_name
    remove_column :items, :attach_content_type
    remove_column :items, :attach_file_size
    remove_column :items, :attach_updated_at
  end
end
