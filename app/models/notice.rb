class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :community_section

  validates :notice_type, presence: true, inclusion: { in: [0, 1, 2] }
  validates :community_section_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
  
end
