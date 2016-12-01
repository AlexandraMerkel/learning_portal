class Role < ApplicationRecord

  has_many :role_users

  validates :role_name, presence: true, uniqueness: true   
  validates :full_name, presence: true, uniqueness: true
  validates :role_name_eng, presence: true, uniqueness: true 
  
end
