require 'spec_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email)  }
  it { should have_many(:queue_items).order(:position) }
  it { should have_many(:reviews).order("created_at DESC") }
  
  it "generates a random token when the user is created" do
    alice = Fabricate(:user)
    expect(alice.token).to be_present
  end
    end

describe "#queued_video?" do
  it "returns true when the user queued the video" do
    user = Fabricate(:user)
    video = Fabricate(:video)
    Fabricate(:queue_item, user: user, video: video)
    user.queued_video?(video).should be_true
  end
  
  it "returns false when the user has not queued the video" do
    user = Fabricate(:user)
    video = Fabricate(:video)
    user.queued_video?(video).should be_false
  end
end

  describe "follows?" do
    it "returns true if the user has a following relationship with the other user" do
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      Fabricate(:relationship, follower_id: alice.id, leader_id: bob.id)
      expect(alice.follows?(bob)).to be_true
    end
    
      it "returns false if the user does not have a following relationship with the other user" do
        alice = Fabricate(:user)
        bob = Fabricate(:user)
        george = Fabricate(:user)
        Fabricate(:relationship, follower_id: alice.id, leader_id: bob.id)
        expect(alice.follows?(george)).to be_false
      end
  end

