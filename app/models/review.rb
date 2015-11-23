class Review < ActiveRecord::Base
  belongs_to :business
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates_presence_of :rating, :content
end