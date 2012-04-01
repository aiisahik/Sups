class AlterUsers < ActiveRecord::Migration
  def up
    	add_column("users", "first_name", :string)
    	add_column("users", "last_name", :string)
    	add_column("users", "hashed_password", :string)
    	add_column("users", "salt", :string, :limit => 40)
  		#puts "**About to add an index **"
  		add_index("users", "username")
  end

  def down
  	remove_index("users", "username")
  	remove_column("users", "salt", :string, :limit => 40)
  	remove_column("users", "hashed_password", :string)
  	remove_column("users", "last_name", :string)
  	remove_column("users", "first_name", :string)
  end
end

