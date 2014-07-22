class Createvideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_image_url
      t.string :name
      t.string :title
      t.text   :body
      t.timestamps
    end
  end
end
