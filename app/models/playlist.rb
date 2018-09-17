# == Schema Information
#
# Table name: playlists
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Playlist < ApplicationRecord
  belongs_to :user

  has_many :tracks
end
