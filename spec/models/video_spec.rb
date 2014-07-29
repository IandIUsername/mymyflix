require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }  
end

describe Video do
  it "save itself" do
    video = Video.new(name: "Ghostbusters", title: "Ghostbusters", body: "Classic flick", description: "Who you gonna call?")
    video.save
    Video.first.name.should == "Ghostbusters"
  end
end
    
    
describe Video do 
   it "saves itself with alternative rspec synatx" do
     video2 = Video.new(name: "Star Trek I", title: "Warp Spped", description: "Where no man has gone before")
     video2.save
     expect(Video.find_by_name "Star Trek I").to eq(video2)
   end
end

describe Video do
  it "has a functioning belongs to association with Category" do
    video3 = Video.new(name: "Tron", category_id: 1, title: "bad graphics", description: "weird motorcycles")
    video3.save
    video4 = Video.find_by_name "Tron"
    expect(video4.category).to eq(Category.find_by_id 1)
   end
end

describe Video do
  it "has a functioning belongs to association with category solution video" do
  dramas = Category.create(category_name: "dramas")
    monk   = Video.create(name: "Neurotic detective", title: "Monk", description: "a great video", category: dramas)
  expect(monk.category).to eq(dramas)
  end
end

describe Video do
  it "allows for the creation of a Video object when name, title and description are present" do
    flintstones = Video.create(name: "Flintstones", title: "Meet the Flintstones", description: "Have a yabba dabba do time")
    expect(flintstones.valid?).to eq(true)
  end
end

#describe Video do
  #it "does not allow for the creation of a Video object when name is missing" do
    #jetsons = Video.create(title: "The future!", description: "George Jetson")
    #expect(jetsons.valid?).to eq(false)
    
  #end
#end

describe Video do
  it "does not allow for the creation a Video object when title is missing" do
    simpsons = Video.create(name: "Don't have a cow, man", description: "Bart!")
    expect(simpsons.valid?).to eq(false)
  end
end

describe Video do
  it "does not save a video without a title - official solution" do
    video = Video.create(description: "a great video")
    expect(Video.count).to eq(0)
  end
end

describe Video do
  it "does not save a video without a description - official solution" do
    video = Video.create(title: "monk")
    expect(Video.count).to eq(0)
  end
end

describe Video do
  it "does not allow for the creation of a Video object when description is missing" do
    scooby_doo = Video.create(name: "Scooby snacks", title: "Yowza! Ghosts!")
    expect(scooby_doo.valid?).to eq(false)
  end
end


