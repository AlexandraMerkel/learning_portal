class DisciplineSection < ApplicationRecord
  
belongs_to :discipline

	validates :section_name, presence: true, uniqueness: true 
	validates :section_type, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
	validates :weight, presence: true,  numericality: {only_integer: true }
	validates :min_score, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 100}
	validates :max_score, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 100}
	validates :require_type, presence: true
	validates :attenuation_constant, presence: true
	validates :optimal_time, presence: true
	validates :limit_time, presence: true
	validates :discipline_id, presence: true

	def score_validator()
		if max_score < min_score
			errors[:max_score] << 'Максимальное количество баллов за раздел не может быть ниже минимального!'
		end
	end

	def time_validator()
		if limit_time < optimal_time
			errors[:limit_time] << 'Крайний срок сдачи не может быть раньше, чем оптимальный!'
		end
	end

end
