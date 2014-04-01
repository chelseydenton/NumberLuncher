json.array!(@observations) do |observation|
  json.extract! observation, :id, :date_time, :line_size
  json.url observation_url(observation, format: :json)
end
