class User < ActiveRecord::Base

  has_many :items
  acts_as_tagger


  attr_accessor :password


EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50
  validates_presence_of :username
  validates_length_of :username, :within => 8..25
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  validates_confirmation_of :email

  validates_length_of :password, :within => 8..25, :on => :create

before_save :create_hashed_password
after_save :clear_password

scope :named, lambda {|first, last| where(:first_name => first, :last_name => last)}
scope :sorted, order("users.last_name ASC, admin_users.first_name ASC")

attr_protected :hashed_password, :salt

def name
	"#{first_name} #{last_name}"
end

def self.authenticate(username="", password="")
	user = User.find_by_username(username)
	if user && user.password_match?(password)
		return user
	else
		return false
	end
end


def password_match?(password="")
	hashed_password == User.hash_with_salt(password, salt)
end


def self.make_salt(username="")
	Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
end


def self.hash_with_salt(password="", salt="")
	Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
end

private
def create_hashed_password
	unless password.blank?
		self.salt = User.make_salt(username) if salt.blank?
		self.hashed_password = User.hash_with_salt(password, salt)
	end
end

def clear_password
	self.password = nil
end




end
