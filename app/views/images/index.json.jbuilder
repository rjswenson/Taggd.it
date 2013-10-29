json.array!(@images) do |image|
  json.extract! image, :name, :location, :user_id
  json.url image_url(image, format: :json)
end
