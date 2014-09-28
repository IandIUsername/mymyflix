class User < ActiveRecord::Base
  
  has_many :queue_items, -> { order(:position) }
  #has_many :queue_items, -> { order(:position) }
  has_many :reviews, -> {order("created_at DESC")}
  has_many :videos, -> { order("created_at DESC") }
  has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
  #has_many :followers 
  
  
  before_create :generate_token
  
# def follows?(another_user)
#   Relationship.where(leader_id: another_user.id, follower_id: self.id).present?
# end
  
  def can_follow?(another_user)
    !(self.follows?(another_user) || self.id == another_user.id)
  end
  
  
  def follows?(another_user)
    self.following_relationships.map(&:leader).include?(another_user)
  end
  
  has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id
  #has_many :leaders
  validates_presence_of :email, :password, :full_name
  validates_uniqueness_of :email
  #has_many :videos
  has_secure_password validations: false
  
  def normalize_queue_item_positions
    queue_items.each_with_index do |item, index|
      item.update_attributes(position: index+1)
    end
  end
  
  def queued_video?(video)
    self.queue_items.map(&:video).include?(video)
  end
  
  #private
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

end