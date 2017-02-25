class Community < ApplicationRecord

	has_many :community_users, inverse_of: :community
	has_and_belongs_to_many :disciplines
	has_many :community_sections

	accepts_nested_attributes_for :community_users, reject_if: proc { |a| a['user_id'].blank? } # Подключение вложенной формы модели community_users

	validates :community_name, presence: true, uniqueness: true
	validates :community_visibility, presence: true,  inclusion: { in: [0, 1, 2] }
	validates :archive, presence: true,  inclusion: { in: [0, 1] }

end
