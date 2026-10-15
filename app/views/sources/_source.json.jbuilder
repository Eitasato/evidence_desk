json.extract! source, :id, :title, :url, :source_type, :created_at, :updated_at
json.url source_url(source, format: :json)
