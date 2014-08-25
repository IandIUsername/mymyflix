class QueueItem < ActiveRecord::Base
  belongs_to :video
  belongs_to :user
  validates_numericality_of :position, {only_integer: true}
  
  delegate :category, to: :video
  delegate :title, to: :video, prefix: :video
 
  
#   def update_queue_items
#     ActiveRecord::Base.transaction do
#       params[:queue_items].each do |queue_item_data|
#         queue_item = self.QueueItem.find(queue_item_data["id"])
#         queue_item.update_attributes!(position: queue_item_data["position"]) if queue_item.user == current_user
#       end
#     end
#   end
      
  
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