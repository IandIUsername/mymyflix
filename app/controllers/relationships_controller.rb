class RelationshipsController < ApplicationController
  before_filter :require_user
  
  
def index
  @relationships = current_user.following_relationships
end
  
  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy if relationship.follower == current_user
    redirect_to people_path
  end
  
  def create
    leader1 = User.find(params[:leader_id])
    Relationship.create(leader_id: params[:leader_id], follower_id: current_user.id) if current_user.can_follow?(leader1)
    redirect_to people_path
  end
  
  
# def create
#   leader1 = params[:leader_id]
#   Relationship.create(leader_id: params[:leader_id], follower_id: current_user.id) unless relationship_exists?(leader1)
#   redirect_to people_path
# end
  
# def relationship_exists?(leader)
  #   Relationship.where(leader_id: leader, follower_id: current_user.id).present?
# end
  
  end

