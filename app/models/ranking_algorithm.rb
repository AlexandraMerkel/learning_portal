class RankingAlgorithm < ApplicationRecord
 
  has_many :disciplines

  validates :algorithm_name, presence: true, uniqueness: true 

end
