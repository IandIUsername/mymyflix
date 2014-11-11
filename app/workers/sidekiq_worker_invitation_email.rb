class SidekiqWorkerInvitationEmail
  include Sidekiq::Worker
  #sidekiq_options retry: false
  #sidekiq_options queue: "high"
  
  def perform(invitation_id)
    @invitation = Invitation.find(invitation_id)
   #AppMailer.send_invitation_email(invitation).deliver
    
  end
  
end