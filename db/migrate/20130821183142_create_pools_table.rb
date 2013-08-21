class CreatePoolsTable < ActiveRecord::Migration
	def change
		create_table "pools", :force => true do |t|
			t.integer "game_id"
			t.integer "user_id"
			t.string "pool_type"
			t.string "status"
			t.integer "buy_in"
			t.integer "max_players"
			t.datetime "created_at"
			t.datetime "updated_at"
		end
  	end
end
