class RoleUser < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :role_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

end
