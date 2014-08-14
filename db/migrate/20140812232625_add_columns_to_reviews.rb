class AddColumnsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :video_id, :integer
    add_column :reviews, :reviewable_type, :string
    add_column :reviews, :reviewable_id, :integer
    add_column :reviews, :rating, :integer
  end
end
