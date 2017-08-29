json.extract! gallery, :id, :title, :description, :media, :active, :tags, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
