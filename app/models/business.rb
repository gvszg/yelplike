class Business < ActiveRecord::Base
  validates_presence_of :name, :address, :region, :country
end