json.extract! course, :id, :code, :title, :semester, :staff_id, :articles_id, :created_at, :updated_at
json.url course_url(course, format: :json)
