class AddStreetToAddress < ActiveRecord::Migration
  def change
  	add_column :address, :street, :string
  end
end
