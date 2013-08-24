class Prize < ActiveRecord::Base
	attr_accessible :user_id, :value, :prize_type, :description, :redeemed, :mailed
	belongs_to :user
	
end