json.extract! movie, :id, :title, :poster, :genre, :runningtime, :age, :created_at, :updated_at
json.url movie_url(movie, format: :json)
