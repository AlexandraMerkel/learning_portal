class Role < ApplicationRecord
  has_many :role_users

  validates :role_name, presence: true, uniqueness: true   
  validates :full_name, presence: true, uniqueness: true
  validates :role_name_eng, presence: true, uniqueness: true 
  
  def self.create_main_roles
    r1 = Role.find_or_create_by(role_name_eng: 'admin', 
      role_name: 'Администратор',
      full_name: 'Администратор портала')
    r2 = Role.find_or_create_by(role_name_eng: 'teacher', 
      role_name: 'Преподаватель',
      full_name: 'Преподаватель')
    [r1, r2]
  end

  ROLE_FOR_METHODS = ['admin', 'teacher']
  
  ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      self.role_name_eng == rname
    end
  end
end
