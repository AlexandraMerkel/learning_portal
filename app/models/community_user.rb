class CommunityUser < ApplicationRecord
  belongs_to :user
  belongs_to :community, inverse_of: :community_users

   ROLES = {
    0 => 'участник',
    1 => 'модератор сообщества',
    2 => 'владелец сообщества'
  }

  validates :link_type, presence: true,  inclusion: { in: ROLES.keys }
  validates :community, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true



end
