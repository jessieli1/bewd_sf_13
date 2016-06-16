class ArtistsController < ApplicationController
  def index
    @artist = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
  end

  def new
    @artist = Artist.new
  end

  def create
    @artists = Artist.new(artist_params)
    if @artist.save #meets validation requirements
      redirect_to artists_path
    else
      render 'new'
    end
  end

  private

  def artists_params
    params.require(:artist).permit(:name, :image, :bio, :genre, :active)
  end
end
