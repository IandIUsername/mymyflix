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
  
  
  
  

  
  
end