class CommunitySection < ApplicationRecord
 
	belongs_to :community
	has_many :community_tabs
	has_many :notices

	validates :section_name, presence: true, uniqueness: {scope: :community_id}
	validates :section_type, presence: true,  inclusion: { in: [0, 1, 2, 3] } , uniqueness: {scope: :community_id} # не может быть двух одинаковых типов секций в одном сообществе
	validates :section_position, presence: true,  inclusion: { in: [0, 1, 2, 3] }
	validates :community_id, presence: true

end
