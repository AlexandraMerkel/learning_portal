class Mark < ApplicationRecord
  belongs_to :discipline_section
  belongs_to :student, :class_name => 'User'
  belongs_to :teacher, :class_name => 'User'

  validates :mark_value, presence: true 
  validates :report, presence: true
  validates :discipline_section_id, presence: true
  validates :student_id, presence: true
  validates :teacher_id, presence: true

end
