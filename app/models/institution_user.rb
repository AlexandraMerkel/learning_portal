class InstitutionUser < ApplicationRecord
  belongs_to :user, inverse_of: :institution_users
  belongs_to :institution

 # validates :rank, presence: true
  validates :institution, presence: true, uniqueness: {scope: :user}
  validates :user, presence: true

end
