json.array!(@articles) do |article|
  json.extract! article, :title, :subtitle, :content, :post_id
  json.url article_url(article, format: :json)
end