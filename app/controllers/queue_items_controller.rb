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
    redirect_to my_queue_path
    #else 
      #flash.notice = "You are not authorized."
     #redirect_to sign_in_path
    #end
  end
  
  def update_queue
    params[:queue_items].each do |queue_item_data|
      queue_item = QueueItem.find(queue_item_data["id"])
      queue_item.update_attributes(position: queue_item_data.pos)
    
    redirect_to my_queue_path
    end
  end
  
  
  private
  
  def queue_video(video)
    QueueItem.create(video: video, user: current_user, position: queue_item_position ) unless current_user_queued_video?(video)
    
  end
  
  def current_user_queued_video?(video)
    current_user.queue_items.map(&:video).include?(video)
  end
  
  def queue_item_position
    current_user.queue_items.count + 1
  end
  
  def queue_item_params
    params.require(:QueueItem).permit(:video_id, :user_id, :position)
  end
end