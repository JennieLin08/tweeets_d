json.extract! todo, :id, :name, :status, :remarks, :created_at, :updated_at
json.url todo_url(todo, format: :json)
