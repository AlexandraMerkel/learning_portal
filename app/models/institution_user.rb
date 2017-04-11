class InstitutionUser < ApplicationRecord
  belongs_to :user, inverse_of: :institution_users
  belongs_to :institution

  validates :rank, presence: true
  validates :institution_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

end
