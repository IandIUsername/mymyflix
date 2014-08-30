require 'spec_helper'

describe QueueItem do
  it { should belong_to(:user) }
  it { should belong_to(:video) }   
  it {should validate_numericality_of(:position).only_integer}
  
  
  describe "#video_title" do
    it "returns the title of the associated video" do
    video = Fabricate(:video, title: "Monkish")
      queue_item = Fabricate(:queue_item, video: video)
    expect(queue_item.video_title).to eq("Monkish")
    end
    
    describe "#rating" do
      it "returns the rating from the review when the review is present" do
        video = Fabricate(:video)
        user = Fabricate(:user)
        review = Fabricate(:review, user: user, video: video, rating: 3)
        queue_item = Fabricate(:queue_item, user: user, video: video)
        expect(queue_item.rating).to eq(3)
        
      end
      
      it "returns nil for rating when the review is not present" do
        video = Fabricate(:video)
        user = Fabricate(:user)
        #review = Fabricate(:review, user: user, video: video, rating: 3)
        review = nil
        queue_item = Fabricate(:queue_item, user: user, video: video)
        expect(queue_item.rating).to eq(nil)
      end
    end
    
    describe "rating=()" do
      it "changes the rating if the review is present" do 
        video1 = Fabricate(:video)
        user1 = Fabricate(:user)
        review = Fabricate(:review, user: user1, video: video1, rating: 2)
        queue_item = Fabricate(:queue_item, user: user1, video: video1)
        queue_item.rating = 4
        expect(Review.first.rating).to eq(4)
      end
        
      it "clears the rating of the review if the review is present" do
        video1 = Fabricate(:video)
        user1 = Fabricate(:user)
        review = Fabricate(:review, user: user1, video: video1, rating:2)
        queue_item = Fabricate(:queue_item, user: user1, video: video1)
        queue_item.rating = nil
        expect(Review.first.rating).to be_nil
      end
      
      it "creates a review with the rating if the review is not present" do
        video1 = Fabricate(:video)
        user1 = Fabricate(:user)
        queue_item = Fabricate(:queue_item, user: user1, video: video1)
        queue_item.rating = 3
        expect(Review.first.rating).to eq(3)
      end
      
      
    end
    
#     describe "#category name" do 
#       it "should return the category name" do 
#         category = Fabricate(:category) 
#         video = Fabricate(:video, category: category) 
#         #video.category_id = 2 # why does this not work, why cant I set the videos category_id later   
#         #video = Fabricate(:video, category_id 2)# why does this not work? 
#         user = Fabricate(:user)
#         q = Fabricate(:queue_item, user: user, video: video)
#         expect(q.category_name).to eq("Drama") 
#       end 
#     end
    
    describe "#category name" do
      it "returns the category nameexit for the video" do
#         binding.pry
        category = Fabricate(:category)
#         video = Fabricate(:video, category: category)
        video = Fabricate(:video, category_id: category.id)
        #video.category_id = 2
        q = Fabricate(:queue_item, video: video)
#         puts " cat = #{category.category_name}"
#         puts "que = #{queue_item.category_name}"
        expect(q.category_name).to eq(category.category_name)
      end
    end
    
    describe "category" do
      it "returns the category of the video" do
        category = Fabricate(:category)
        video = Fabricate(:video, category: category)
        queue_item = Fabricate(:queue_item, video: video)
        #expect(queue_item.category).to eq(video.category)
        expect(queue_item.category).to eq(category)
       
      end
    end
    
    
end
end

