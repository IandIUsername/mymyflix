class Category < ActiveRecord::Base
  has_many :videos, -> { order(created_at: :desc) }
  has_many :reviews, as: :reviewable
  def recent_videos
    self.videos.first(6)
  end

end


