# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  artist     :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  belongs_to :playlist
end
