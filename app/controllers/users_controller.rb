class UsersController < ApplicationController
  
  before_filter :require_user, only: [:show]
  
  def new_with_invitation_token
    invitation = Invitation.where(token: params[:token]).first
    if invitation
    @user = User.new(email: invitation.recipient_email)
      @invitation_token = invitation.token
    render :new
    else
      redirect_to expired_invitation_token_path
    end
  end
  
  def expired_invitation_token
    flash.notice = "expired token"
    render :new
  end
  
  def new
    @user = User.new
  end
  
  
  def create 
    @user = User.create(user_params)
    if @user.save
      handle_invitation
      #AppMailer.send_welcome_email(@user).deliver
      AppMailer.delay.send_welcome_email(@user.id)
      #AppMailer.send_welcome_email.SideKiqWorkerWelcomeEmail.perform_async(@user.id)
      redirect_to sign_in_path
    else
      render :new
    end
  end
  
  def show
    
    @user = User.find(params[:id])
    
  end
  
  
  def edit
    
    
  end
  
  
  def update
    
    
  end
  
  
  
  def destroy
    
  end
  
  def user_params
    params.require(:user).permit(:full_name, :password, :password_digest, :email, :salt, :encrypted_password)
  end
    
  def handle_invitation
    if params[:invitation_token].present?
        invitation = Invitation.where(token: params[:invitation_token]).first
        @user.follow(invitation.inviter)
        invitation.inviter.follow(@user)
        invitation.update_column(:token, nil)
        #invitation.token = nil
        #invitation.save
    end
  end
    
  
end