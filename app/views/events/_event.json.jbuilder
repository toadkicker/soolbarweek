json.extract! event, :id, :title, :subtitle, :short_description, :description, :start_time, :end_time, :type, :price, :created_at, :updated_at
json.url event_url(event, format: :json)
