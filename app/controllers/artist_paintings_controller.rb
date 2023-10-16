class ArtistPaintingsController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @paintings = @artist.paintings
    if (params[:order] == "name")
      @paintings = @artist.paintings.order(name: :asc)
    end
    if params[:search]
      year_painted = params[:search].to_i
      require 'pry'; binding.pry
      @paintings = @artist.paintings.where("year_painted > ?", year_painted)
    end
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

  def paintings_search_params
    params.require(:painting).permit(:name, :year_painted, :oil_painting, :search)
  end
end