class Community < ApplicationRecord

	has_many :community_users, inverse_of: :community
	has_and_belongs_to_many :disciplines
	has_many :community_sections

  VISIBILITIES = {
    0 => 'видно для всех пользователей',
    1 => 'видно владельцу и модераторам сообщества',
    2 => 'видно только владельцу сообщества'
  }

  ARCHIVES = {
    0=>'функционирует',
    1=>'в архиве'
  }

	accepts_nested_attributes_for :community_users, reject_if: proc { |a| a['user_id'].blank? }, allow_destroy: true # Подключение вложенной формы модели community_users

	validates :community_name, presence: true, uniqueness: true
	validates :community_visibility, presence: true,  inclusion: { in: VISIBILITIES.keys }
	validates :archive, presence: true,  inclusion: { in: ARCHIVES.keys }

  def Community.search_communities_for_user
    Community.includes(:community_users).where("community_users.user_id = ?", @current_user_object.id).references(:community_users)
  end

end
