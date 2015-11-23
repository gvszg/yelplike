class User < ActiveRecord::Base
  has_secure_password
  has_many :businesses
  has_many :reviews

  validates_presence_of :email, :password, :full_name
  validates_uniqueness_of :email
end