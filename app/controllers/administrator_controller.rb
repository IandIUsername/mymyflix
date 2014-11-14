class AdministratorController < AuthenticationController
  
  before_filter :require_administrator
  
  
  def require_administrator
    unless current_user.admin_flag?
      flash.notice = "You are not authorized as an administrator."
      redirect_to home_path
    end
  end
  
end