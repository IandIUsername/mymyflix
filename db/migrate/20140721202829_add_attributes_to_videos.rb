class AddAttributesToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :description, :text
    add_column :videos, :small_cover_url, :string
    add_column :videos, :large_cover_url, :string
    
  end
end
