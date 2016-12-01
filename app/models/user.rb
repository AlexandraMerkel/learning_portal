class User < ApplicationRecord
  
  has_many :role_users
  has_and_belongs_to_many :groups
  has_many :community_users
  has_many :community_contents, foreign_key: :creator_id
  has_many :marks, foreign_key: :student_id
  has_many :marks, foreign_key: :teacher_id
  has_and_belongs_to_many :message_list_users
  has_many :messages, foreign_key: :sender_id
  has_many :message_users
  has_many :institution_users
  has_many :notices
  has_many :study_files

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true, inclusion: { in: ['м', 'ж'] }
  validates :user_description, length: {maximum: 250}

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true

end
