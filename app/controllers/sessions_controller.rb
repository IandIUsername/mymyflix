class SessionsController < ApplicationController


  def new
    
    redirect_to home_path if current_user
    
  end
  
  def create
    user = User.where(email: params[:email]).first
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to home_path, notice: 'You are signed in'
      else
        flash[:error] = 'Invalid username or password'
        redirect_to sign_in_path
      end
    #session[:id] = User.find(user_params)   
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You are signed out'
  end

  def user_params
  params.require(:user).permit(:full_name, :email, :password, :id)
  end
  

end