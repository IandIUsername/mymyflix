class Video < ActiveRecord::Base
  
  
  has_many :reviews, as: :reviewable
  belongs_to :user
  belongs_to :category
  validates_presence_of :title, :description
  
  
  
  
  def self.search_by_title(title)
    return [] if title.blank?
    #if title
      where( "title LIKE ?", "%#{title.downcase}%").order("created_at DESC") # removed leading %
    #else
      #""
    end
  end
  