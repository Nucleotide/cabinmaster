json.array!(@supplies) do |supply|
  json.extract! supply, :id, :info, :cabin_id
  json.url supply_url(supply, format: :json)
end
