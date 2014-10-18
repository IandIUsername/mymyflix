class InvitationsController < ApplicationController
  before_filter :require_user
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.inviter_id = current_user.id
   if @invitation.save
     AppMailer.send_invitation_email(@invitation).deliver
     flash[:success] = "Booya!, you have successfully sent an invitation to #{@invitation.recipient_email} "
    redirect_to new_invitation_path
   else
     flash.notice = "uh oh"
     render :new
  end
  end
  
  private
  
  def invitation_params
   params.require(:invitation).permit(:recipient_name, :recipient_email, :messages, :inviter_id)
  end
end