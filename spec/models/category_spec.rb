require 'spec_helper'


describe Category do
  it { should have_many(:videos) } 
  it { should validate_presence_of(:category_name) }
  
  describe "#recent_videos" do
    it "returns the videos in reverse chronological order by created_at" do
      comedies = Category.create(category_name: "comedies")
      futurama = Video.create(title: "futurma", description: "space travel", category: comedies, created_at: 1.day.ago)   
      south_park = Video.create(title: "south park", description: "small town colorado", category: comedies)
      expect(comedies.recent_videos).to eq([south_park, futurama])
    end
    
    
    
    it "returns all the videos if there are less than 6 videos" do
      comedies = Category.create(category_name: "comedies")
      futurama = Video.create(title: "futurma", description: "space travel", category: comedies, created_at: 1.day.ago)   
      south_park = Video.create(title: "south park", description: "small town colorado", category: comedies)
      expect(comedies.recent_videos.count).to eq(2)
      
    end
    
    
    it "returns only 6 videos if there are more than 6 videos" do
    comedies = Category.create(category_name: "comedies")
      7.times { Video.create(title: "foo", description: "description of foo", category: comedies)}
      expect(comedies.recent_videos.count).to eq(6)
      
    end
    
    it "returns the most recent 6 videos" do 
     comedies = Category.create(category_name: "comedies") 
      6.times { Video.create(title: "foo", description: "description of foo", category: comedies)}
      old_video = Video.create(title: "Beverly Hillbillies", description: "Uncle Jed", category: comedies, created_at: 1.week.ago)
      expect(comedies.recent_videos).not_to include(old_video)  
  end
    
    it "returns an empty array if the category does not have any videos" do
      comedies = Category.create(category_name: "comedies")
      expect(comedies.recent_videos).to eq([])
      
    end
  
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
end
