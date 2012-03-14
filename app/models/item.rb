class Item < ActiveRecord::Base

  has_many :category_items
  has_many :categories, :through => :category_items
  belongs_to :vendor
  
  validates :name, :presence => true
  validates :description, :presence => true
  
  has_attached_file :pic, :styles =>
             { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :attach

  acts_as_taggable
  acts_as_taggable_on :tags, :events
  belongs_to :user

end
