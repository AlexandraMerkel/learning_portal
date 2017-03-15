class CommunityDiscipline < ApplicationRecord
  belongs_to :discipline
  belongs_to :community, inverse_of: :community_disciplines

  validates :community, presence: true, uniqueness: {scope: :discipline_id}
  validates :discipline_id, presence: true

end
