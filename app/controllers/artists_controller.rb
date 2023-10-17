class ArtistsController < ApplicationController
  def index
    @artists = Artist.order_by_created
    # require 'pry'; binding.pry
    if params[:order] == "num_paint"
      @artists = Artist.order_by_paintings
    end
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @paintings = @artist.number_of_paintings   
  end

  def new
  end

  def create
    artist = Artist.create(artist_params)
    redirect_to "/artists"
  end

  def artist_params
    params.permit(:name, :country, :year_born, :alive)
  end

  def edit
    @artist = Artist.find(params[:artist_id])  
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @artist.update(artist_params)
    redirect_to "/artists"
  end

  def destroy
    Artist.find(params[:artist_id]).destroy
    redirect_to "/artists" 
  end
end