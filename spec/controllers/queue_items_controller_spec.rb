require 'spec_helper'

describe QueueItemsController do
  describe "GET index" do
    it "sets the @queue_items to the queue items of the logged in user" do
      
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      queue_item1 = Fabricate(:queue_item, user: alice)
      queue_item2 = Fabricate(:queue_item, user: alice)
      
      get :index
      expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])
    end
    
    it "redirects to the sign in page for unauthenticated users" do
      session[:user_id] = nil
      get :index
      expect(response).to redirect_to sign_in_path
    end
    
  end
  
  describe "Post Create" do
    it "redirects to the my queue_page" do
    session[:user_id] = Fabricate(:user).id
    video = Fabricate(:video)
    post :create, video_id: video
    expect(response).to redirect_to my_queue_path
    end
    
    it "creates a queue item" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video
      expect(QueueItem.count).to eq(1)
      
    end
    it "creates a queue item that is associated with a video" do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      post :create, video_id: video
      expect(QueueItem.first.video).to eq(video)
      
    end
    it "creates a queue item that is associated with the signed in user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      video = Fabricate(:video)
      #video.user_id = user.id
      post :create, video_id: video
      expect(QueueItem.first.user).to eq(user)
    end
    it "puts the video as the last one in the queue" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      monk = Fabricate(:video)
      Fabricate(:queue_item, video: monk, user: user)
      south_park = Fabricate(:video)
      post :create, video_id: south_park.id
      south_park_queue_item = QueueItem.where(video_id: south_park.id, user_id: user.id).first
      expect(south_park_queue_item.position).to eq(2)
      
    end
    it "does not ad the video to the queue if it is already in the queue" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      monk = Fabricate(:video)
      Fabricate(:queue_item, video: monk, user: user)
      post :create, video_id: monk.id
      expect(user.queue_items.count).to eq(1)
      
      
    end
    it "redirects to the sign in page for unauthenticated users" do
      post :create, video_id: 3
      expect(response).to redirect_to sign_in_path
    end
      
    

  end
  
  describe "Delete Destroy" do
    it "redirects to the my queue page" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      #session[:user_id] = Fabricate(:user).id
      queue_item = Fabricate(:queue_item, user: user)
      delete :destroy, id: queue_item.id
      expect(response).to redirect_to my_queue_path
    end
    it "deletes the my queue item" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      queue_item = Fabricate(:queue_item, user: user)
      delete :destroy, id: queue_item.id
      expect(user.queue_items.count).to eq(0)
      #expect(QueueItem.count).to eq(0)
      
    end
 
    it "does not delete the queue item if the current user is not associated with the queue item" do
      user1 = Fabricate(:user)
      user2 = Fabricate(:user)
      session[:user_id] = user1.id
      queue_item = Fabricate(:queue_item, user: user2)
      delete :destroy, id: queue_item.id
      expect(QueueItem.count).to eq(1)
      
    end
    
    it "redirect to the sign in page for unauthenticated users" do
    user1 = Fabricate(:user)
    session[:user_id] = nil
    queue_item = Fabricate(:queue_item, user: user1)
    delete :destroy, id: queue_item.id
    expect(response).to redirect_to sign_in_path
    end
    
  end
  
  
end