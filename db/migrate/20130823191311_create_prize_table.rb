class CreatePrizeTable < ActiveRecord::Migration
  def change
  	create_table "prizes", :force => true do |t|
  		t.integer "user_id"
  		t.integer "value"
  		t.integer "prize_type"
  		t.string  "description"
  		t.integer "redeemed"
  		t.integer "mailed"
  	end
  end
end
