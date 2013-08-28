class CreateAddressTable < ActiveRecord::Migration
  def change
  	create_table "address", :force => true do |t|
  		t.integer "user_id"
  		t.integer "street_number"
  		t.string "city"
  		t.integer "zipcode"
  		t.string "country"
  		t.integer "phone"
  	end
  end
end
