class CreateCreditTable < ActiveRecord::Migration
  def change
  	create_table "credits", :force => true do |t|
	    t.integer "user_id"
	    t.integer "pool_id"
	    t.string  "credit_code"
	    t.integer "value", :default => 1
	    t.datetime "created_at"
	    t.datetime "updated_at"
	  end
  end
end
