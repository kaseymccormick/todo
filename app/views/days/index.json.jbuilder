json.array!(@days) do |day|
  json.extract! day, :id, :title
  json.url day_url(day, format: :json)
end
