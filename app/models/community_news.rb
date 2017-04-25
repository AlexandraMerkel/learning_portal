class CommunityNews < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :news_body, presence: true

  def self.table_name
    "community_news"
  end

end
