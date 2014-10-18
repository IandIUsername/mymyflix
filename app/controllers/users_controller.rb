class UsersController < ApplicationController
  
  before_filter :require_user, only: [:show]
  
  def new_with_invitation_token
    
  end
  
  
  def new
    @user = User.new
  end
  
  
  def create 
    @user = User.create(user_params)
    if @user.save
      AppMailer.send_welcome_email(@user).deliver
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
  
end