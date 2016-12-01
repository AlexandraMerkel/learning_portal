class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :community_section

  validates :notice_type, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  validates :community_section_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
  validates :community_section_id, presence: true

end
