require 'spec_helper'


describe UsersController do
  
   after { ActionMailer::Base.deliveries.clear }
  
  describe "GET show" do
    it_behaves_like "require sign in" do
      let(:action) { get :show, id: 3 }
    #expect(response).to redirect_to user_show_path
  end
    
    it "sets @user" do
      alice = Fabricate(:user)
      set_current_user(alice)
      get :show, id: alice.id
      expect(assigns(:user)).to eq(alice)
    end
  
end
  describe "GET new_with_invitation_token" do
    it "sets @user with recipient's' email" do
      invitation = Fabricate(:invitation)
      get :new_with_invitation_token, token: invitation.token
      expect(assigns(:user).email).to eq(invitation.recipient_email)
    end
    
    
    it "sets @invitation token" do
      invitation = Fabricate(:invitation)
      get :new_with_invitation_token, token: invitation.token
      expect(assigns(:invitation_token)).to eq(invitation.token)
    end
    
    it "renders the :new view template" do
      invitation = Fabricate(:invitation)
      get :new_with_invitation_token, token: invitation.token
      expect(response).to render_template :new
    end
    it "redirects to expired token page for invalid tokens" do
      get :new_with_invitation_token, token: "random token"
      expect(response).to redirect_to expired_invitation_token_path
    end
  end
  
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
   end
  end
  
  describe "POST create" do
    context "with valid input" do
      before do
        post :create, user: Fabricate.attributes_for(:user )
      end
      
      it "makes the user follow the inviter" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation, inviter: alice, recipient_email: 'joe@example.com')
        post :create, user: { email: 'joe@example.com', password: 'password', full_name: 'john doe' }, invitation_token: invitation.token
        joe = User.where(email: 'joe@example.com').first
        expect(joe.follows?(alice)).to be_true
        
      end
      
      it "makes the inviter follow the user" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation, inviter: alice, recipient_email: 'joe@example.com')
        post :create, user: { email: 'joe@example.com', password: 'password', full_name: 'john doe'}, invitation_token: invitation.token
        joe = User.where(email: 'joe@example.com').first
        expect(alice.follows?(joe)).to be_true
      end
      it "expires the invitation upon acceptance" do
        alice = Fabricate(:user)
        invitation = Fabricate(:invitation, inviter: alice, recipient_email: 'joe@example.com')
        post :create, user: { email: 'joe@example.com', password: 'password', full_name: 'john doe' }, invitation_token: invitation.token
        expect(Invitation.first.token).to be_nil
        
      end
      
      it "creates the user" do   
      expect(User.count).to eq(1)
      end
      
      it "redirects to the sign_in page" do  
      expect(response).to redirect_to sign_in_path
      end
    end
    
    context "with invalid input" do
      before do
        post :create, user: { password: "password", full_name: "Joe Blow" }
          end
      it "does not create the user" do
        expect(User.count).to eq(0)
      end
        
      it "renders the :new template" do
        expect(response).to render_template :new  
      end
      
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
  

end
end
  
  context "sending emails" do
    
    after { ActionMailer::Base.deliveries.clear }
    
    it "sends out email to the user with valid inputs" do
      post :create, user: { email: "user10@mail.com", password: "password", full_name: "user10" }
      expect(ActionMailer::Base.deliveries.last.to).to eq(["user10@mail.com"])
      
    end
    it "sends out email containing the users name with valid inputs" do
      post :create, user: { email: "user10@mail.com", password: "password", full_name: "user10" }
      expect(ActionMailer::Base.deliveries.last.body).to include("user10")
    end
    it "does not send out email with invalid inputs" do
      post :create, user: { email: nil, password: "password", full_name: "user10" }
expect(ActionMailer::Base.deliveries).to be_empty
    end
    
  end
  
end