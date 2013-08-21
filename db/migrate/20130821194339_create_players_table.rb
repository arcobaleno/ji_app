class CreatePlayersTable < ActiveRecord::Migration
	def change
		create_table "players", :force => true do |t|
			t.integer "user_id"
			t.integer "pool_id"
			t.integer "team_one_predicted_score"
			t.integer "team_two_predicted_score"
			t.boolean "winner", :default => false
			t.datetime "created_at"
			t.datetime "updated_at"
		end
	end
end
