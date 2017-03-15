class Community < ApplicationRecord

	has_many :community_users, inverse_of: :community
	has_many :community_disciplines, inverse_of: :community
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
  accepts_nested_attributes_for :community_disciplines, reject_if: proc { |a| a['discipline_id'].blank? }, allow_destroy: true # Подключение вложенной формы модели community_disciplines


	validates :community_name, presence: true, uniqueness: true
	validates :community_visibility, presence: true,  inclusion: { in: VISIBILITIES.keys }
	validates :archive, presence: true,  inclusion: { in: ARCHIVES.keys }

  # Метод выводит ВСЕ сообщества, связанные с пользователем
  def Community.search_communities_for_user(attributes)
    Community.includes(:community_users).where("community_users.user_id = ?", attributes).references(:community_users)
  end

  # Метод выводит роль данного пользователя в данном сообществе (в виде цифры 0/1/2)
  def Community.check_access_to_edit_community(user_attr, comm_attr)
    Community.includes(:community_users).where("community_users.user_id = ?", user_attr).where("community_users.community_id = ?", comm_attr).references(:community_users).pluck("community_users.link_type").first
  end

  # Метод проверяет есть ли у пользователя доступ к просмотру сообщества
  def Community.check_access_to_community(user_attr)
    list_communities = Community.search_communities_for_user(user_attr)
    list_communities.each do |cur_comm|
      if cur_comm.community_visibility == 1
        usr = Community.check_access_to_edit_community(user_attr, cur_comm.id)
        if usr == 0
          list_communities = list_communities.reject { |item| item == cur_comm}
        end
      elsif cur_comm.community_visibility == 2
        usr = Community.check_access_to_edit_community(user_attr, cur_comm.id)
        if usr == 0 || usr == 1
          list_communities = list_communities.reject { |item| item == cur_comm}
        end
      end
    end
    list_communities
  end

end
