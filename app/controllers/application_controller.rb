class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def require_user
    redirect_to sign_in_path unless current_user
  end
  
  def current_user
    current_user = current_user || session[:user_id] && User.find_by_id(session[:user_id])
  end
  
#   def current_user
#      @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id]) # Use find_by_id to get nil instead of an error if user doesn't exist
#    end
  
#   def current_user
#     if session[:user_id] && User.find(session[:user_id]) != nil
#       return User.find(session[:user_id])
#     else
#       redirect_to sign_in_path
#     end
#   end
  
#   def current_user 
#     User.find(session[:user_id]) if session[:user_id]
#   end
  
  helper_method :current_user
  
end
