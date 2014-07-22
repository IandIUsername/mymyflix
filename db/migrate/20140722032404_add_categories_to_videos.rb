class AddCategoriesToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :categories, :string
  end
end
