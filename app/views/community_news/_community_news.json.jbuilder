json.extract! community_news, :id, :news_body, :user_id, :community_id, :created_at, :updated_at
json.url community_news_url(community_news, format: :json)