class Admin::VideosController < AdministratorController
  #why is this necessary if there is the same before filter in authentication controller?
  #this puts the before filters out of their natural order of ApplicationController-AuthenticationController-AdministratorController?
  #why is this hitting AdministratorsController require_administrator instead of just running require_user from application controller
  before_filter :require_user
  
  def new
    @video = Video.new
    
  end
  
  def create
    
  end
  
  
  
  
  def require_user
    unless current_user
      flash.notice = "You are not signed in, please do so if you have an account, otherwise please sign up for an account."
      redirect_to sign_in_path
    end
  end
  
  
end