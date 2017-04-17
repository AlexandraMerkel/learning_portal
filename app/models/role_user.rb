class RoleUser < ApplicationRecord
  belongs_to :user, inverse_of: :role_users
  belongs_to :role

  validates :role, presence: true, uniqueness: {scope: :user}
  validates :user, presence: true

  Role::ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      self.role.role_name_eng == rname
    end
  end

  def humanize()
    self.role.role_name
  end

end