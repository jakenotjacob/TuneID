load 'LastFM.rb'

class Tune < ActiveRecord::Base
  def album_cover
    api_request = LastFM.new(self.artist, self.title)
    album_cover = api_request.album_cover_url
  end
end
