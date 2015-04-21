json.array!(@blogs) do |blog|
  json.extract! blog, :id, :blog_title, :blog_text, :blog_date, :blog_link
  json.url blog_url(blog, format: :json)
end
