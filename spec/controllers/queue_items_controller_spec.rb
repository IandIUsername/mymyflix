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
    
    it "normalizes the positions" do
      user1 = Fabricate(:user)
      session[:user_id] = user1.id
      queue_item1 = Fabricate(:queue_item, user: user1, position: 1)
      queue_item2 = Fabricate(:queue_item, user: user1, position: 2)
      delete :destroy, id: queue_item1.id
      #expect(queue_item2.reload.position).to eq(1)
      expect(QueueItem.first.position).to eq(1)
    end
    
  end
  
  describe "POST update_queue" do
    context "with valid inputs" do
      it "redirects to the my queue page" do
        susanna = Fabricate(:user)
        session[:user_id] = susanna.id
        video = Fabricate(:video)
        #review = Fabricate(:review, user: susanna, video: video, rating: 2)
        queue_item1 = Fabricate(:queue_item, user: susanna, position: 1, video: video)
        queue_item2 = Fabricate(:queue_item, user: susanna, position: 2, video: video)
        post :update_queue, queue_items: [{id: queue_item1.id, position: 2, rating: 2}, {id: queue_item2.id, position: 1, rating: 2}]
        expect(response).to redirect_to my_queue_path
        
      end
      it "reorders the my queue items" do
        sharona = Fabricate(:user)
        video = Fabricate(:video)
        session[:user_id] = sharona.id
        queue_item1 = Fabricate(:queue_item, user: sharona, position: 1, video: video )
        queue_item2 = Fabricate(:queue_item, user: sharona, position: 2, video: video)
        post :update_queue, queue_items: [{id: queue_item1.id, position: 2}, {id: queue_item2.id, position: 1}]
        expect(sharona.queue_items).to eq([queue_item2, queue_item1])
        
      end
      it "normalizes the position numbers" do 
        
        cecilia = Fabricate(:user)
        session[:user_id] = cecilia.id
        video = Fabricate(:video)
        queue_item1 = Fabricate(:queue_item, user: cecilia, position: 1, video: video)
        queue_item2 = Fabricate(:queue_item, user: cecilia, position: 2, video: video)
        post :update_queue, queue_items: [{id: queue_item1.id, position: 3}, {id: queue_item2.id, position: 2}]
        #expect(cecilia.queue_items.map(&:position)).to eq([1, 2])
        expect(queue_item1.reload.position).to eq(2)
        expect(queue_item2.reload.position).to eq(1)
      end
      
    end
    context "with invalid inputs" do
      it "redirects to the my_queue_path" do
        
      jessie = Fabricate(:user)
      session[:user_id] = jessie.id
       video = Fabricate(:video) 
      queue_item1 = Fabricate(:queue_item, user: jessie, position: 1, video: video)
      queue_item2 = Fabricate(:queue_item, user: jessie, position: 2, video: video)
      post :update_queue, queue_items: [{id: queue_item1.id, position: "a"}, {id: queue_item2.id, position: "b"}]
      expect(response).to redirect_to my_queue_path
      
      
    end
      
      it "sets the flash error message" do
        rosanna = Fabricate(:user)
        session[:user_id] = rosanna.id
        video = Fabricate(:video)
        queue_item1 = Fabricate(:queue_item, user: rosanna, position: 1, video: video)
        queue_item2 = Fabricate(:queue_item, user: rosanna, position: 2, video: video)
        post :update_queue, queue_items: [{id: queue_item1.id, position: 2.3}, {id: queue_item2.id,  position: 3.2}]
        expect(flash[:error]).to be_present
      end
      
      it "does not change the queue items page" do
        gloria = Fabricate(:user)
        session[:user_id] = gloria.id
        video = Fabricate(:video)
        queue_item1 = Fabricate(:queue_item, user: gloria, position: 1, video: video)
        queue_item2 = Fabricate(:queue_item, user: gloria, position: 2, video: video)
        post :update_queue, queue_items: [{id: queue_item1.id, position: 3}, {id: queue_item2.id, position: 2.1}]
        expect(queue_item1.reload.position).to eq(1)
      end
      
    end
      context "with unauthenticated users" do
        it "redirects to the sign_in_path" do
          monica = Fabricate(:user)
          session[:user_id] = nil
          video = Fabricate(:video)
          queue_item1 = Fabricate(:queue_item, user: monica, position: 1, video: video)
          queue_item2 = Fabricate(:queue_item, user: monica, position: 2, video: video)
          post :update_queue, queue_items: [{id: queue_item1.id, position: 1}, {id: queue_item2.id, position: 2}]
          expect(response).to redirect_to sign_in_path
      end
      end 
        context "with queue items that do not belong to the current user" do
          it "does not change the queue_items" do
            sylvia = Fabricate(:user)
            morgana = Fabricate(:user)
            video = Fabricate(:video)
            session[:user_id] = sylvia
            queue_item1 = Fabricate(:queue_item, user: sylvia, position: 1, video: video)
            queue_item2 = Fabricate(:queue_item, user: morgana, position: 2, video: video)
            post :update_queue, queue_items: [{id: queue_item1.id, position: 3}, {id: queue_item2.id, position: 2}]
            expect(queue_item1.reload.position).to eq(1)
        end
        
        end
    
        
  end
end