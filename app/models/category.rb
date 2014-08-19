class Category < ActiveRecord::Base
  has_many :videos, -> { order(created_at: :desc) }
  has_many :reviews, as: :reviewable
  
  validates_presence_of :category_name
  def recent_videos
    self.videos.first(6)
  end

end


