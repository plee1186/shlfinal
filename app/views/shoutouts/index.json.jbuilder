json.array!(@shoutouts) do |shoutout|
  json.extract! shoutout, :id, :content
  json.url shoutout_url(shoutout, format: :json)
end
