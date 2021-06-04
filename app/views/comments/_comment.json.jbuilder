json.extract! comment, :id, :author_id, :arcade_id, :body, :created_at, :updated_at
json.url comment_url(comment, format: :json)
