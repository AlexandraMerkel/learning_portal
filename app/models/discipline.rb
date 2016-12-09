class Discipline < ApplicationRecord
  
  belongs_to :term
  belongs_to :ranking_algorithm
  has_many :discipline_sections
  has_and_belongs_to_many :communities
  has_and_belongs_to_many :institutions

  validates :discipline_name, presence: true, uniqueness: {scope: [:discipline_type, :discipline_end]}
  validates :discipline_type, presence: true, inclusion: { in: [0, 1, 2, 3] }
  validates :discipline_end, presence: true, inclusion: { in: [0, 1] }
  validates :term_id, presence: true
  validates :ranking_algorithm_id, presence: true

end