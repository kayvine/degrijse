json.array!(@resumes) do |resume|
  json.extract! resume, :id, :title, :year, :location, :text, :artists, :curator, :link
  json.url resume_url(resume, format: :json)
end
