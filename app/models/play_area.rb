class PlayArea < ActiveRecord::Base
  belongs_to :installation
  has_many :plays
end
