class Person < ActiveRecord::Base
	validates :first_name, presence: true
	validates :second_name, presence: true
	validates :address, presence: true
	validates :phone_number, presence: true

	scope :first_name, -> (first_name) { where(first_name: first_name) }
	scope :second_name, -> (second_name) { where(second_name: second_name) }
	scope :address, -> (address) { where(address: address) }
	scope :phone_number, -> (phone_number) { where(phone_number: phone_number) }
end
