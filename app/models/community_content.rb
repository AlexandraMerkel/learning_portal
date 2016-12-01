class CommunityContent < ApplicationRecord
  belongs_to :community_tab
  belongs_to :creator, :class_name => 'User'

  validates :view_type, presence: true, inclusion: { in: ['0', '1'] }
  validates :content_body, presence: true
  validates :content_visibility, presence: true, {only_integer: true, greater_than_or_equal_to: 0, less_than: 4}
  validates :community_tab_id, presence: true
  validates :creator_id, presence: true

end
