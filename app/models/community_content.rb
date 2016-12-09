class CommunityContent < ApplicationRecord
  belongs_to :community_tab
  belongs_to :creator, :class_name => 'User'

  validates :view_type, presence: true, inclusion: { in: [0, 1] } # html или markdown
  validates :content_body, presence: true
  validates :content_visibility, presence: true, inclusion: { in: [0, 1, 2] }
  validates :community_tab_id, presence: true
  validates :creator_id, presence: true

end
