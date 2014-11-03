require 'spec_helper'

describe InvitationsController do
  describe "GET new" do
    it "sets @invitation to a new invitation" do
      set_current_user
      get :new
      expect(assigns(:invitation)).to be_new_record
      expect(assigns(:invitation)).to be_instance_of Invitation
    end
    it_behaves_like 'require sign in' do
      let(:action) { get :new }
    end
  end
  
  describe "post create" do
    it_behaves_like "require sign in" do
      let(:action) { post :create }
    end
    
    context "with valid input" do
      it "redirects to the invitation new page" do
        set_current_user
        post :create, invitation: { recipient_name: "joe smith", recipient_email: "joe@example.com", messages: "You will join myflix."}
        expect(response).to redirect_to new_invitation_path
      end
    it "creates an invitation" do
      set_current_user
      post :create, invitation: { recipient_name: "joe smith", recipient_email: "joe@example.com", messages: "You will join myflix." }
      puts Invitation.first
      expect(Invitation.count).to eq(1)
    end
    it "sends an email to the recipient" do
      set_current_user
      post :create, invitation: { recipient_name: "joe smith", recipient_email: "joe@example.com", messages: "You will join myflix." }
      expect(ActionMailer::Base.deliveries.last.to).to eq(["joe@example.com"])
    end
  
    it "redirects to the invitation new page" do
      set_current_user
      post :create, invitation: { recipient_name: "joe smith", recipient_email: "joe@example.com", messages: "you will join myflix." }
      expect(response).to redirect_to new_invitation_path
    end
    it "sets the flash success message" do
      set_current_user
      post :create, invitation: { recipient_name: "joe smith", recipient_email: "joe@example.com", messages: "you will join myflix." }
      expect(flash[:success]).to be_present
    end
    end
  context "with invalid input" do
    
    after { ActionMailer::Base.deliveries.clear }
    
    it "renders the new template" do
      set_current_user
      post :create, invitation: { recipient_email: "joe@example.com", messages: "you will join myflix." }
      expect(response).to render_template :new
    end
    it "does not create an invitation" do
      set_current_user
      post :create, invitation: { recipient_email: "joe@example.com", messages: "you will join myflix" }
      expect(Invitation.count).to eq(0)
    end
    it "does not send out an email" do
      set_current_user
      post :create, invitation: { recipient_email: "joe@example.com", messages: "you will join myflix" }
      expect(ActionMailer::Base.deliveries).to be_empty
    end 
    it "sets the flash error message" do
      set_current_user
      post :create, invitation: { recipient_email: "joe@example.com", messages: "you will join myflix" }
      expect(flash.notice).to eq("uh oh")
    end
    it "sets @invitation" do
      set_current_user
      post :create, invitation: { recipient_email: "joe@example.com", messages: "you will join myflix" }
      expect(assigns(:invitation)).to be_present
    end
  end
  end
end