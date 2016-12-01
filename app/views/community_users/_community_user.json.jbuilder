json.extract! community_user, :id, :link_type, :user_id, :community_id, :created_at, :updated_at
json.url community_user_url(community_user, format: :json)