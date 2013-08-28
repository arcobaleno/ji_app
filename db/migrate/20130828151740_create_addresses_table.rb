class CreateAddressesTable < ActiveRecord::Migration
  def change
  	create_table "addresses", :force => true do |t|
  		t.integer "user_id"
  		t.integer "street_number"
  		t.string "street"
  		t.string "city"
  		t.integer "zipcode"
  		t.string "country"
  		t.string "phone"
  	end
  end
end
