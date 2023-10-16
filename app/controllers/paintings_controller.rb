class PaintingsController < ApplicationController
  def index
    @paintings = Painting.where(oil_painting: :true)
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

  def destroy
    Painting.find(params[:painting_id]).destroy
    redirect_to "/paintings"
  end

  def painting_params
    params.permit(:name, :year_painted, :oil_painting)
  end
end