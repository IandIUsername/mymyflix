class User_SessionsController < ApplicationController
  
  def create
    
    session[user_id] = User.find(params[:id])
    redirect_to 'videos#index'
    
  end


end