require "open-uri"

class Item < ActiveRecord::Base

  has_many :category_items
  has_many :categories, :through => :category_items
  belongs_to :users
  
  validates :name, :presence => true
  #validates :description, :presence => true

  validates_uniqueness_of :id
  
  has_attached_file :pic, :styles =>
             { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :attach
  has_attached_file :image,  :styles =>
             { :medium => "300x300>", :thumb => "100x100>" }
  
  acts_as_taggable
  acts_as_taggable_on :tags, :events, :groups 



  #attr_accessor :image_remote_url

  #:image_remote_url_provided?
  #validates_presence_of :image_remote_url, :if => :image_remote_url_provided?, :message => 'is invalid or inaccessible'

  #private

  #def image_remote_url_provided?
    #!self.image_remote_url.blank?
  #end

  #def download_remote_image
    #self.image = do_download_remote_image
    #self.image_remote_url = image_remote_url
  #end

  #def do_download_remote_image
    #io = open(URI.parse(image_remote_url))
    #def io.original_filename; base_uri.path.split('/').last; end
    #io.original_filename.blank? ? nil : io
  #rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
  #end




end
