json.array!(@tunes) do |tune|
  json.extract! tune, :id, :artist, :album, :title
  json.url tune_url(tune, format: :json)
end
