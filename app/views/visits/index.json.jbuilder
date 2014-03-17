json.array!(@visits) do |visit|
  json.extract! visit, :id, :time, :cabin_id, :user_id
  json.url visit_url(visit, format: :json)
end
