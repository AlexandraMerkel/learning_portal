class Mark < ApplicationRecord
  belongs_to :discipline_section
  belongs_to :student, :class_name => 'User'
  belongs_to :teacher, :class_name => 'User'

  validates :mark_value, presence: true, numericality: {only_integer: true, greater_than: 0, less_than: 100}
  #validates :report, presence: true
  validates :discipline_section_id, presence: true, uniqueness: {scope: [:student_id, :teacher_id]}
  validates :student_id, presence: true
  validates :teacher_id, presence: true

  #validate :mark_validator

  # метод пока не работает
  def mark_validator()
    Rails.logger.info '*'*100
    Rails.logger.info discipline_section_id
    if mark_value.present?
      if mark_value < DisciplineSection.where('id = ?', discipline_section_id).first.min_score || mark_value > DisciplineSection.where('id = ?', discipline_section_id).first.max_score
        errors[:mark_value] << 'Оценка выходит за возможные границы баллов за данный раздел'
      end
    end
  end

end