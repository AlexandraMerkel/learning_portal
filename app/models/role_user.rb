class RoleUser < ApplicationRecord
  belongs_to :user
  belongs_to :role

  validates :role_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
  
  Role::ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      self.role.role_name_eng == rname
    end
  end

  def humanize()
    self.role.role_name
  end
end
