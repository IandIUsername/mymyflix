class FixNameCoverInVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :small_cover_url, :cover_image_url
  end
end
