class Initial < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null=>false
      t.timestamps
    end

    create_table :items do |t|
      t.string :name, :null => false
      t.integer :description
      t.string :image_link
      t.timestamps
    end

    create_table :collections do |t|
      t.string :name, :null => false
      t.string :description
      t.integer :user_id
      t.timestamps
    end
    add_index :collections, [:user_id]

    create_table :categories do |t|
      t.string :name, :null => false
      t.string :description
      t.timestamps
    end

    create_table :categories_items do |t|
      t.references :category
      t.references :item
      t.timestamps
    end
    add_index :categories_items, ['category_id', 'item_id']

  end

  def down
    drop_table :users
    drop_table :collections
    drop_table :categories
    drop_table :items
    drop_table :categories_items
  end
end
