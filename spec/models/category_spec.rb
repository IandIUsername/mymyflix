require 'spec_helper'


describe Category do
  it { should have_many(:videos) } 
end


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
    expect(category2a.id).to eq(video.category.id)
   end
end

describe Category do
  it "has a functioning has many association with videos - official solution" do  
    comedies = Category.create(category_name: "Comedies")
    south_park = Video.create(name: "Small Colorado town", title: "South Park", description: "Funny video", category: comedies)
    futurama   = Video.create(name: "Cryoaccident", title: "Futurama", description: "Futuristic", category: comedies)
    expect(comedies.videos).to include(south_park, futurama) 
  end
end

describe Category do
  it "has a functioning has many association with videos - official solution with order set to title in videos controller" do
    comedies = Category.create(category_name: "Comedies")
    south_park = Video.create(name: "not the most detailed animation", title: "South Park", description: "Funny video", category: comedies)
    futurama   = Video.create(name: "Fry!", title: "Futurama", description: "Futuristic", category: comedies)
    expect(comedies.videos).to eq([futurama, south_park])
  end
end