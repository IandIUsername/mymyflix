class PasswordResetsController < ApplicationController
  
  def show
#     binding.pry
    user = User.where(token: params[:id]).first
    if user
      @token = user.token
    else
    #require 'pry' ; binding.pry
    redirect_to expired_token_path
    end
    #@token = params[:id]
  end
  
  def create
#     raise params.inspect
    user = User.where(token: params[:token]).first
    if user
      user.password = params[:password]
      user.generate_token
      user.save
      flash[:success] = "Your password has been updated"
      redirect_to sign_in_path
    else
      redirect_to expired_token_path
    end
  
  end
  
end