
class Video < ActiveRecord::Base

  belongs_to :category
  validates_presence_of :title, :description
  
  def self.search_by_title(title)
    if search
      where( ":title LIKE ?", "%#{title.downcase}%" )
    else
      find(:all)
    end
  end
  

end