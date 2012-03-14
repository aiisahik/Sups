class User < ActiveRecord::Base

  has_many :collections
  acts_as_tagger

end
