class ArtistPaintingsController < ApplicationController
  def index
    artist = Artist.find(params[:artist_id])
    @paintings = artist.paintings
  end
end