require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  def  setup
    @user = create :user
    @playlist = create :playlist, user: @user
  end

  test "tracks are created for playlists" do
    @playlist.tracks.create(name: 'a_track', artist: 'formerly', url: 'youtube.com')
  end

  test "tracks must have a name" do
    assert_raises ActiveRecord::NotNullViolation do
      @playlist.tracks.create(artist: 'formerly', url: 'youtube.com')
    end
  end

  test "tracks must have an artist" do
    assert_raises ActiveRecord::NotNullViolation do
      @playlist.tracks.create(name: 'namish', url: 'youtube.com')
    end
  end

  test "tracks must have a url" do
    assert_raises ActiveRecord::NotNullViolation do
      @playlist.tracks.create(name: 'formerly', artist: 'quality singer')
    end
  end

  test "tracks must have a playlist" do
    error = assert_raises ActiveRecord::RecordInvalid do
      Track.create!(name: 'a_track', artist: 'formerly', url: 'youtube.com')
    end
    assert_match(/Playlist must exist/, error.message)
  end

  test "when a playlist is deleted so is its tracks" do
    track = @playlist.tracks.create(name: 'a_track', artist: 'formerly', url: 'youtube.com')
    @playlist.destroy
    assert_nil(Track.find_by(id: track.id))
  end

  test "when a user is deleted so are their (playlist) tracks" do
    track = @playlist.tracks.create(name: 'a_track', artist: 'formerly', url: 'youtube.com')
    @user.destroy
    assert_nil(Track.find_by(id: track.id))
  end
end
