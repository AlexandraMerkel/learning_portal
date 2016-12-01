class Group < ApplicationRecord
 
  belongs_to :term
  has_and_belongs_to_many :users

  validates :group_name, presence: true, uniqueness: true 
  validates :group_start, presence: true
  validates :term_id, presence: true

  def date_validator()
	if archive_time < group_start
		errors[:archive_time] << 'Отправка группы в архив не может произойти раньше ее создания!'
	end
  end

end
