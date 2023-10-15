class PaintingsController < ApplicationController
  def index
    @paintings = Painting.all
  end

  def show
    @painting = Painting.find(params[:painting_id])
  end

  def edit
    @painting = Painting.find(params[:painting_id])
  end

  def update
    @painting = Painting.find(params[:painting_id])
    @painting.update(painting_params)
    redirect_to "/paintings/#{@painting.id}"
  end

  def painting_params
    params.permit(:name, :year_painted, :oil_painting)
  end
end