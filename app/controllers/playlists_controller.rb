class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
    @playlist.tracks.new
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    @playlist.save!
    tracks_params.each do |track_params|
      @playlist.tracks.create(track_params)
    end
    redirect_to @playlist
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :tracks_attributes)
  end

  def tracks_params
    params[:playlist][:tracks_attributes]
      .values
      .select do |inputs|
        inputs.values.all?(&:present?)
      end
  end
end
