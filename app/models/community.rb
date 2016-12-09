class Community < ApplicationRecord

	has_many :community_users
	has_and_belongs_to_many :disciplines
	has_many :community_sections

	validates :community_name, presence: true, uniqueness: true 
	validates :community_visibility, presence: true,  inclusion: { in: [0, 1, 2] }
	validates :archive, presence: true,  inclusion: { in: [0, 1] }

end
