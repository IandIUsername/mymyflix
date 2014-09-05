class User < ActiveRecord::Base
  
  has_many :queue_items, -> { order(:position) }
  #has_many :queue_items, -> { order(:position) }
  has_many :reviews
  has_many :videos

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

end