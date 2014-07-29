
class Video < ActiveRecord::Base

  belongs_to :category
  validates_presence_of :title, :description
  
  def self.search_by_title(title)
    if title
      where( "title LIKE ?", "#{title.downcase}%" ) # removed leading %
    else
      all
    end
  end
  

end