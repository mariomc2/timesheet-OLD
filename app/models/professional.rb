class Professional < ActiveRecord::Base

	has_many :contact_details
	has_many :company_appointments
	has_many :professional_appointments
	has_and_belongs_to_many :clients
	has_many :employments
	has_many :companies, :through => :employments

	validates_presence_of :first_name

	scope :sorted_name, lambda { order("professionals.first_name ASC")}
	scope :sorted_Lastname, lambda { order("professionals.last_name ASC")}
  scope :newest_first, lambda { order("professionals.created_at DESC")}
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  }

end
