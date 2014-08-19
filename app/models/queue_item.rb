class QueueItem < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  
  
  delegate :category, to: :video
  delegate :title, to: :video, prefix: :video
  
#   def video_title
    
#     self.video.title
    
#   end
  
  def rating
   
    review = Review.where(user: self.user.id, video_id: self.video.id).first
#     if review == nil
#       return 100
#     else
    review.rating if review
  end
#   end
  
  
  #def rating
    #if self.video.reviews = nil
      #"no review, hence no rating"
    #else
      #self.videos.reviews.each do |review|
    #x  
    #else
      #"no rating"
    #end
  #end
  
  
  
#   def category_name
#     self.video.category.category_name
#   end
  
  def category_name
    category.category_name
  end
  
  
#   def category
#     self.video.category
#   end
  
 
  
end