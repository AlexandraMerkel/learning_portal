class CommunityTab < ApplicationRecord
 
  belongs_to :community_section
	has_many :community_contents

	validates :tab_name, presence: true, uniqueness: {scope: :community_section_id}
	validates :tab_position, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 100 } 
	validates :community_section_id, presence: true

end
