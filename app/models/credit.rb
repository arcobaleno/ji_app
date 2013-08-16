class Credit < ActiveRecord::Base
	attr_accessible :credit_id, :user_id, :pool_id, :credit_code, :value, :created_at, :updated_at
	belongs_to :user
	#belongs_to :pool
end