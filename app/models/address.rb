class Address < ActiveRecord::Base
	attr_accessible :user_id, :street_number, :street, :city, :zipcode, :state, :country, :phone

	belongs_to :user

end