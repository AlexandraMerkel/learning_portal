class DisciplineSection < ApplicationRecord

  has_many :marks
  belongs_to :discipline

  SECTION_TYPE = {
    0=>'посещаемость',
    1=>'домашние задания',
    2=>'проверочные/самостоятельные работы',
    3=>'контрольные работы',
    4=> 'зачёт',
    5=> 'экзамен',
    6=>'допольнительные задания'
  }

  REQUIRE_TYPE = {
    0=>'по желанию',
    1=>'обязательно'
  }

  validates :discipline_type, presence: true
  validates :section_name, presence: true, uniqueness: {scope: :discipline_id}
  validates :section_type, presence: true, inclusion: { in: SECTION_TYPE.keys }
  validates :weight, presence: true,  numericality: {only_integer: true, greater_than: 0, less_than: 11}
  validates :min_score, presence: true,  numericality: {only_integer: true, greater_than: 0, less_than: 100}
  validates :max_score, presence: true,  numericality: {only_integer: true, greater_than: 0, less_than: 100}
  validates :require_type, presence: true, inclusion: { in: REQUIRE_TYPE.keys }
  validates :attenuation_constant, presence: true, numericality: {greater_than: 0, less_than: 1 }
  validates :optimal_time, presence: true
  validates :limit_time, presence: true
  validates :discipline_id, presence: true

  validate :score_validator
  validate :time_validator

  def score_validator()
    if max_score.present? && min_score.present?
      if max_score < min_score
        errors[:max_score] << 'Максимальное количество баллов за раздел не может быть ниже минимального'
      end
    end
  end

  def time_validator()
    if limit_time < optimal_time
      errors[:limit_time] << 'Крайний срок сдачи не может быть раньше, чем оптимальный'
    end
  end

  #def autosave
    # callback
  #end

end