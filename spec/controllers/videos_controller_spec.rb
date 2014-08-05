require 'spec_helper'


describe VideosController do
  describe "GET show" do
    context "with authenticated users" do
      before do
        session[:user_id] = Fabricate(:user).id     
    end
    end
      
    it "sets @video" do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)    
     end
    
    context "with unauthenticated users" do
      it "redirects the user to the sign in page" do
        video = Fabricate(:video)
        get :show, id: video.id
        expect(response).to redirect_to sign_in_path
   
      end 
    end
  end
end
