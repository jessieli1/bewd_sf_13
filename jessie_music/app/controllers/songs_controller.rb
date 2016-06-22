class SongsController < ApplicationController
  def index
    @song = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = get_song
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      render "new"
    end
  end

  def edit
  end

  def updated
  end

  def destroy
  end

  private

  def song_params
    params.require(:song).permit(:title, :length, :artist_id)
  end

  def get_song
    Song.find(params[:id])
  end
end
