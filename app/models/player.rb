class Player < ActiveRecord::Base
	attr_accessible :user_id, :pool_id, :team_one_predicted_score, :team_two_predicted_score, :winner
	belongs_to :pool
	belongs_to :user

end