json.extract! lesson_event, :id, :seeker_id, :lesson_id, :status, :created_at, :updated_at
json.url lesson_event_url(lesson_event, format: :json)
