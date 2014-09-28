require 'spec_helper'

describe ForgotPasswordsController do
  describe "post create" do
    context "with blank input" do
      it "redirects to the forgot password page" do
      post :create, email: ''
      expect(response).to redirect_to forgot_password_path
    end
      it "shows an errror message" do
        post :create, email: ''
        expect(flash[:error]).to eq("email cannot be blank")
    end
    end
    context "with existing email" do
      it "redirects to the forgot password confirmation page" do
        Fabricate(:user, email: "user100@mail.com")
        post :create, email: "user100@mail.com"
        expect(response).to redirect_to forgot_password_confirmation_path
      end
      it "sends out an email to the email address" do
        Fabricate(:user, email: "user100@mail.com")
        post :create, email: "user100@mail.com"
        expect(ActionMailer::Base.deliveries.last.to).to eq(["user100@mail.com"])
      end
      
    end
    
    context  "with nonexistent email" do
      it "redirects to the forgot_password page" do
        Fabricate(:user, email: "user100@mail.com")
        post :create, email: "user200@mail.com"
        expect(response).to redirect_to forgot_password_path
        
      end
      it "shows an error message" do
        Fabricate(:user, email: "user100@mail.com")
        post :create, email: "user200@mail.com"
        expect(flash[:error]).to eq("no such user")
      end
      
    end
  end
end