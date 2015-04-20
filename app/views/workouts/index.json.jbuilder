json.array!(@workouts) do |workout|
  json.extract! workout, :id, :area, :movements, :notes, :duration
  json.url workout_url(workout, format: :json)
end
