class Business < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :name, :address, :region, :country
end