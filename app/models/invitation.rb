

class Invitation < ActiveRecord::Base
  
  include Tokenable
  
   belongs_to :inviter, class_name: "User"
  
  validates_presence_of :recipient_name, :recipient_email, :messages
  
    #def inviter(invitation)
      #x = invitation.inviter_id
      #User.find_by_id(x)
     #User.find(invitation.inviter_id)
  #end
  
 
  
end