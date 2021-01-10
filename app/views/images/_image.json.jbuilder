json.extract! image, :id, :name, :description, :image_url, :property_id, :created_at, :updated_at
json.url image_url(image, format: :json)
