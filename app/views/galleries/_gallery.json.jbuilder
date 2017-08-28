json.extract! gallery, :id, :title, :description, :media, :active, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
