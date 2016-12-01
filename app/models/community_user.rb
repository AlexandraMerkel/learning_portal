class CommunityUser < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :community_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

end
