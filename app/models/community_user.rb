class CommunityUser < ApplicationRecord
  belongs_to :user
  belongs_to :community, inverse_of: :community_users

  validates :link_type, presence: true,  inclusion: { in: [0, 1, 2, 3] }
  validates :community, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

end
