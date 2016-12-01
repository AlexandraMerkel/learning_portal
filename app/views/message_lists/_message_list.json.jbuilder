json.extract! message_list, :id, :header, :created_at, :updated_at
json.url message_list_url(message_list, format: :json)