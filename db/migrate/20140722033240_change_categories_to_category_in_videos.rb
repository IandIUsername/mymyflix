class ChangeCategoriesToCategoryInVideos < ActiveRecord::Migration
  def change
    rename_column :videos, :categories, :category
  end
end
