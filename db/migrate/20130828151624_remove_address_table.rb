class RemoveAddressTable < ActiveRecord::Migration
  def change
  	drop_table :address
  end
end
