require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  def  setup
    @user = create :user
  end

  test "playlists must have a name" do
    assert_raises ActiveRecord::NotNullViolation do
      @user.playlists.create
    end
  end

  test "a playlist cannot exist without a user" do
    error = assert_raises ActiveRecord::RecordInvalid do
      Playlist.create!(name: 'the best songs')
    end
    assert_match(/User must exist/, error.message)
  end

  test "when a user is deleted so are their playlists" do
    playlist = @user.playlists.create(name: 'good songs')
    @user.destroy
    assert_nil(Playlist.find_by(id: playlist.id))
  end
end
