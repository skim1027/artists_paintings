class ArtistPaintingsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @paintings = @artist.paintings
  end

  def new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    painting = @artist.paintings.create(painting_params)
    redirect_to "/artists/#{@artist.id}/paintings"
  end

  def painting_params
    params.permit(:name, :year_painted, :oil_painting)
  end
end