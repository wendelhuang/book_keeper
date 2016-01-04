json.array!(@record_types) do |record_type|
  json.extract! record_type, :id, :title, :image
  json.url record_type_url(record_type, format: :json)
end
