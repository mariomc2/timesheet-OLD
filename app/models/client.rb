class Client < ActiveRecord::Base

	has_many :contact_details
	belongs_to :company
	belongs_to :branch
	has_many :appointments
	has_and_belongs_to_many :professionals

end
