class DisciplineSection < ApplicationRecord
  
belongs_to :discipline

	validates :section_name, presence: true, uniqueness: {scope: :discipline_id} 
	validates :section_type, presence: true, inclusion: { in: [0, 1, 2, 3, 4] }
	validates :weight, presence: true,  numericality: {only_integer: true }
	validates :min_score, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 100}
	validates :max_score, presence: true,  numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 100}
	validates :require_type, presence: true, inclusion: { in: [0, 1] }
	validates :attenuation_constant, presence: true, numericality: {greater_than: 0 }
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

end
