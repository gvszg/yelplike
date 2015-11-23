class Business < ActiveRecord::Base
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  
  validates_presence_of :name, :address, :region, :country
end