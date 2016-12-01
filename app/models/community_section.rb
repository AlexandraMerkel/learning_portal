class CommunitySection < ApplicationRecord
 
	belongs_to :community
	has_many :community_tabs
	has_many :notices

	validates :section_name, presence: true, uniqueness: {scope: :community_id}
	validates :section_type, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 4}, uniqueness: {scope: :community_id}
	validates :section_position, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0} 
	validates :community_id, presence: true

end
