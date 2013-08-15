class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table "users", :force => true do |t|
  		t.string   "email"
  		t.string   "last_name"
	    t.string   "first_name"
	    t.string   "password_digest"
	    t.string   "remember_token"
	    t.integer  "user_type", :default => 1
	    t.string   "avatar"
	    t.integer  "status", :default => 1
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
  end
end
