class ChangeZipcodeToString < ActiveRecord::Migration
  def change
  	remove_column :addresses, :zipcode
  	add_column :addresses, :zipcode, :string 
  end
end
