class Category_Item < ActiveRecord::Base

  belongs_to :category
  belongs_to :item

end
