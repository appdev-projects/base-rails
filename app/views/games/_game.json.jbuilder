json.extract! game, :id, :title, :description, :release_date, :created_at, :updated_at
json.url game_url(game, format: :json)
