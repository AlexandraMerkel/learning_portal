class Group < ApplicationRecord
 
  belongs_to :term
  has_and_belongs_to_many :users

  validates :group_name, presence: true, uniqueness: true 
  validates :group_start, presence: true
  validates :term_id, presence: true
  validate :date_validator

  def date_validator()
	if archive_time < group_start
		errors[:archive_time] << 'Отправка группы в архив не может произойти раньше ее создания'
	end
  end

end

def Group.create_by_json(json)
    results = []
    begin
      json.each_with_index do |group_hash, i|
           begin
            u = Group.new(group_hash)
            u.save
            if u.errors.size > 0
              results << "Учебная группа № #{i + 1} содержит ошибки!"
            else
              results << "Учебная группа № #{i + 1} #{u.discipline_name} зарегистрирована."
            end
          rescue
            results << "Учебная группа № #{i + 1} содержит ошибки!"
          end
      end
    rescue
      results << 'JSON файл не корректен!'
    end
    results
  end
