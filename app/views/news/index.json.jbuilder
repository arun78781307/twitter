json.array!(@news) do |news|
  json.extract! news, :id, :Title
  json.url news_url(news, format: :json)
end
