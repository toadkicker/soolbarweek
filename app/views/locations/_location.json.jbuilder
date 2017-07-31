json.extract! location, :id, :name, :description, :slug, :photo, :logo, :created_at, :updated_at
json.url location_url(location, format: :json)
