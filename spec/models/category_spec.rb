require 'spec_helper'


describe Category do
  it "saves itself" do
    category = Category.new(category_name: "Classics")
    category.save
    expect(Category.first).to eq(category)
  end
end


describe Category do
  it "has a functioning has many association with videos" do
    category2 = Category.new(category_name: "Documentaries")
    category2.save
    video = Video.new(category_id: category2.id)
    video.save
    category2a = Category.find_by_category_name "Documentaries"
    expect(video.category_id).to eq(category2a.id)
   end
end