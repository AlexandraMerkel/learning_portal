class Community < ApplicationRecord

	has_many :community_users, inverse_of: :community
	has_and_belongs_to_many :disciplines
	has_many :community_sections

  VISIBILITIES = {
    0 => 'видно для всех пользователей', 
    1 => 'видно владельцу и модераторам/редакторам сообщества', 
    2 => 'видно только владельцу сообщества'
  }
  
	accepts_nested_attributes_for :community_users, reject_if: proc { |a| a['user_id'].blank? }, allow_destroy: true # Подключение вложенной формы модели community_users

	validates :community_name, presence: true, uniqueness: true
	validates :community_visibility, presence: true,  inclusion: { in: VISIBILITIES.keys }
	validates :archive, presence: true,  inclusion: { in: [0, 1] }

end
