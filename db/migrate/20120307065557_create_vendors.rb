class CreateVendors < ActiveRecord::Migration

  def up
    create_table :vendors do |t|
      t.string :name, :null => false
      t.string :email
      t.timestamps
    end

    create_table :categories_vendors do |t|
      t.references :category
      t.references :vendor
      t.timestamps
    end
    add_index :categories_vendors, ['category_id', 'vendor_id']


  end

  def down
    drop_table :vendors
    drop_table :categories_vendors
  end

end
