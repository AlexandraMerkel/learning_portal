class Discipline < ApplicationRecord

  belongs_to :term
  belongs_to :ranking_algorithm
  has_many :discipline_sections
  has_many :community_disciplines
  has_and_belongs_to_many :institutions

  SHORT_TYPES = {
    0 => 'Л',
    1 => 'ПР',
    2 => 'ЛАБ',
    3 => 'НИР'
  }

  TYPES = {
    0 => 'лекция',
    1 => 'семинар',
    2 => 'лабораторная работа',
    3 => 'курсовая/практическая/научно-исследовательская работа'
  }

  DIS_END = {
    0 => 'зачёт',
    1 => 'экзамен',
    2 => 'защита работы'
  }

  validates :discipline_name, presence: true, uniqueness: {scope: [:discipline_type, :discipline_end]}
  validates :discipline_type, presence: true #, inclusion: { in: TYPES.keys }
  validates :discipline_end, presence: true, inclusion: { in: DIS_END.keys }
  validates :term_id, presence: true
  validates :ranking_algorithm_id, presence: true

end

  def Discipline.create_by_json(json)
    results = []
    begin
      json.each_with_index do |discipline_hash, i|
           begin
            u = Discipline.new(discipline_hash)
            u.save
            if u.errors.size > 0
              results << "Дисциплина № #{i + 1} содержит ошибки!"
            else
              results << "Дисциплина № #{i + 1} #{u.discipline_name} зарегистрирована."
            end
          rescue
            results << "Дисциплина № #{i + 1} содержит ошибки!"
          end
      end
    rescue
      results << 'JSON файл не корректен!'
    end
    results
  end
