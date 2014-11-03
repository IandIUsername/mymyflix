class ForgotPasswordsController < ApplicationController
  
  def new
    
    
  end
  
  
  def create
    user = User.where(email: params[:email]).first
    if user
      
      #AppMailer.send_forgot_password(user).deliver
      AppMailer.delay.send_forgot_password(user.id)
      #AppMailer.send_forgot_password.SidekiqWorkerForgotPasswordEmail.async(user.id)
      redirect_to forgot_password_confirmation_path
    else
      flash[:error] = params[:email].blank? ? "email cannot be blank" : "no such user"
    redirect_to forgot_password_path
  end
  end
  
  def confirm
  end
  
  
end