class Item < ActiveRecord::Base

  has_many :category_items
  has_many :categories, :through => :category_items
  belongs_to :vendor

end
