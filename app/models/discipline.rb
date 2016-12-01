class Discipline < ApplicationRecord
  
  belongs_to :term
  belongs_to :ranking_algorithm
  has_many :discipline_sections
  has_and_belongs_to_many :communities
  has_and_belongs_to_many :institutions

  validates :discipline_name, presence: true, uniqueness: {scope: [:discipline_type, :discipline_end, :term_id]}
  validates :discipline_type, presence: true
  validates :discipline_end, presence: true
  validates :term_id, presence: true
  validates :ranking_algorithm_id, presence: true

end
