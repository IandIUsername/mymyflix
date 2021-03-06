class QueueItemsController < ApplicationController
  
  before_filter :require_user
  
  def index
    
    @queue_items = current_user.queue_items
  end
  
  def create
    video = Video.find(params[:video_id])
    queue_video(video)
   # QueueItem.create(video: video, user: current_user, position: queue_item_position ) unless current_user_queued_video?(video)
    redirect_to my_queue_path
  end
  
  def destroy
    q = QueueItem.find(params[:id])
    #q.delete
    #if q.user_id == current_user.id
    q.destroy if current_user.queue_items.include?(q)
    current_user.normalize_queue_item_positions
    redirect_to my_queue_path
    #else 
      #flash.notice = "You are not authorized."
     #redirect_to sign_in_path
    #end
  end
  
  def update_queue
#     if params[:rating1]
#       redirect_to video_review_path(video_id: params
#       return
#     else 
#     end
     begin
      update_queue_items
      current_user.normalize_queue_item_positions
    rescue ActiveRecord::RecordInvalid
       flash[:error] = "Invalid position numbers."
    end
      redirect_to my_queue_path
    end
  #end
  
  
  private
  
#   def normalize_queue_item_positions
#     current_user.queue_items.each_with_index do |queue_item, index|
#     queue_item.update_attributes(position: index+1)
#     end
#   end

  def update_queue_items
      ActiveRecord::Base.transaction do
      params[:queue_items].each do |queue_item_data|
      queue_item = QueueItem.find(queue_item_data["id"])
        queue_item.update_attributes!(position: queue_item_data["position"], rating: queue_item_data["rating"]) if queue_item.user == current_user
        end
     end
  
end
  
  def queue_video(video)
    QueueItem.create(video_id: video.id, user: current_user, position: queue_item_position ) unless current_user_queued_video?(video)
    
  end
  
  def current_user_queued_video?(video)
    current_user.queue_items.map(&:video).include?(video)
  end
  
  def queue_item_position
    current_user.queue_items.count + 1
  end
  
  def queue_item_params
    params.require(:QueueItem).permit(:video_id, :user_id, :position, :rating, :video)
  end
end