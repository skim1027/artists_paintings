class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    @artists = @artists.order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
    @paintings = @artist.number_of_paintings   
  end

  def new
  end

  def create
    artist = Artist.create(name: params[:name], year_born: params[:year_born], country: params[:country], alive: params[:alive])
    redirect_to "/artists"
  end
end