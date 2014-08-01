class UsersController < ApplicationController
  
  
  def new
    
    @user = User.new
  end
  
  
  def create
    
    @user = User.create(user_params)
    if @user.save
      redirect_to sign_in_path
    else
      render :new
    end
  end
  
  def show
    
    
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