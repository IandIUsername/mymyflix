require 'spec_helper'

describe Video do
  it "save itself" do
  video = Video.new(name: "Ghostbusters", title: "Ghostbusters", body: "Classic flick")
  video.save
  Video.first.name.should == "Ghostbusters"
  end
end
    
    
describe Video do 
   it "saves itself with alternative rspec synatx" do
   video2 = Video.new(name: "Star Trek I")
   video2.save
   expect(Video.find_by_name "Star Trek I").to eq(video2)
  end
end

describe Video do
  it "has a functioning belongs to association with Category" do
    video3 = Video.new(name: "Tron", category_id: 1)
    video3.save
    video4 = Video.find_by_name "Tron"
    expect(video4.category).to eq(Category.find_by_id 1)
end
  end

