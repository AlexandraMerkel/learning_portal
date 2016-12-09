class Term < ApplicationRecord

  has_many :groups 
  has_many :disciplines

  validates :term_name, presence: true, uniqueness: true
  validates :term_start, presence: true, uniqueness: true
  validates :term_end, presence: true, uniqueness: true
  validate :date_validator

  def date_validator()
		if term_end < term_start
			errors[:term_end] << 'Конец семестра не может быть раньше его начала'
		end
  end


end
