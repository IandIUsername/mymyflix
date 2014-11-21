class AppMailer < ActionMailer::Base
  
  default from: "My Flix"
  
  def send_welcome_email(user_id)
    @user = User.find(user_id)
#     @user = user
    mail to: @user.email, from: "info@myflix.com", subject: "welcome to myflix, yeah!"
  end
  
  def send_forgot_password(user_id)
    @user = User.find(user_id)
    #@user = user
    mail to: @user.email, from: "info@myflix.com", subject: "Please reset your password"
  end
 
  
  def send_invitation_email(invitation_id)
    @invitation = Invitation.find(invitation_id)
    #@invitation = invitation
    mail to: @invitation.recipient_email, from: "info@myflix.com", subject: "it is all about myflix"
  end
  
end