class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    @artists = @artists.order(created_at: :desc)
  end

  def show
    @artist = Artist.find(params[:id])
  end
end