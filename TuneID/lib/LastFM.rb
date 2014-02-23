require 'faraday'
require 'json'

class LastFM
  attr_accessor :artist, :title, :track_info
  def initialize(artist, title)
    @artist = artist
    @title = title
    @conn = open_connection()
    @track_info = get_track_info()
  end

  APIKEY = File.open(Rails.root.join "lib", "api_key.txt").read.chomp
  LASTFM_API = "http://ws.audioscrobbler.com"

  def open_connection
    Faraday.new(url: LASTFM_API ) do |faraday|
      faraday.response :logger 
      faraday.adapter  Faraday.default_adapter
    end
  end
 
  def get_track_info
    response = @conn.get do |req|
      req.url '2.0/'
      req.params = { artist: @artist, track: @title, api_key: APIKEY }
      req.params[:format] = 'json'
      req.params[:autocorrect] = 1
      req.params[:method] = 'track.getInfo'
    end
    JSON.parse(response.body)
  end

  def album_cover_url
    @track_info["track"]["album"]["image"].last["#text"]
  end
  
end


