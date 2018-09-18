class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    @playlist.save!
    redirect_to @playlist
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
