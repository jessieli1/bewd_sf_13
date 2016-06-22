class ArtistsController < ApplicationController
  def index
    @artist = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def show
    @artist = get_artist
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render "new"
    end
  end

  def edit
    @artist = get_artist
  end

  def update
    @artist = get_artist
    if @artist.update(artist_params)
      redirect_to artist_path(@artist), notice: "Artist successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    @artist = get_artist
    @artist.destroy
    redirect_to artists_path
  end

  private

  # Defines which model and what attributes are permitted to be created/changed by user/request
  def artist_params
    params.require(:artist).permit(:name, :bio, :image_link)
  end

  # Dry principle - this method is used by multiple actions, so write it once
  def get_artist
    Artist.find(params[:id])
  end
end
