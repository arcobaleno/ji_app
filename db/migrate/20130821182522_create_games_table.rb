class CreateGamesTable < ActiveRecord::Migration
   def change
  	create_table "games", :force => true do |t|
	    t.integer "user_id"
	    t.string "type"
	    t.string "team_one"
	    t.string "team_two"
	    t.integer "team_one_score"
	    t.integer "team_two_score"
	    t.string "winner"
	    t.datetime "created_at"
	    t.datetime "updated_at"
	end
  end
end
