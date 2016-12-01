class Community < ApplicationRecord

	has_many :community_users
	has_and_belongs_to_many :disciplines
	has_many :community_sections

	validates :community_name, presence: true, uniqueness: true 
	validates :community_visibility, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 5} 
	validates :archive, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 3} 

end
