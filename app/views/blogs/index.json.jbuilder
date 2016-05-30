json.array!(@blogs) do |blog|
  json.extract! blog, :id, :name, :author, :link, :image
  json.url blog_url(blog, format: :json)
end
