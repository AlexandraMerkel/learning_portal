json.extract! message, :id, :message_content, :send, :message, :message_list_id, :sender_id, :created_at, :updated_at
json.url message_url(message, format: :json)