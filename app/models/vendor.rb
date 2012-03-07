class Vendor < ActiveRecord::Base

  has_many :items
  has_many :collections
  has_many :categories, :through => :category_vendors

end
