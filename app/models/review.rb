class Review < ActiveRecord::Base
  
  
  belongs_to :video
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  validates_presence_of :content, :rating
end