class AuthenticationController < ApplicationController
  
  before_filter :require_user
  
  def require_user
    unless current_user
      flash.notice = "You are not signed in, please do so if you have an account, otherwise please sign up for an account."
      redirect_to sign_in_path
    end
  end

end