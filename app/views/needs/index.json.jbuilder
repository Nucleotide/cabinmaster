json.array!(@needs) do |need|
  json.extract! need, :id, :info, :cabin_id, :user_id
  json.url need_url(need, format: :json)
end
