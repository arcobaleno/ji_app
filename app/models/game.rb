class Game < ActiveRecord::Base
 attr_accessible :user_id, :sport, :team_one, :team_two, :team_one_score, :team_two_score, :winner

 belongs_to :user_id
 has_many :users, :through => :pools
 has_many :pools

 default_scope order: 'games.created_at DESC'
end