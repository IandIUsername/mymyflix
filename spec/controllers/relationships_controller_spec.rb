require 'spec_helper'

describe RelationshipsController do
  
  describe "GET index" do
    it "sets @relationships to the current users following relationships" do
      alice = Fabricate(:user)
      set_current_user(alice)
      bob = Fabricate(:user)
      relationship = Fabricate(:relationship, follower: alice, leader: bob)
      get :index
      expect(assigns(:relationships)).to eq([relationship])
      
    end
  end
  
 
    describe "DELETE destroy" do
      it_behaves_like "require sign in" do
        let(:action) { post :create, leader_id: 3 }
      end
   
    
      it "deletes the relationship if the current user is the follower" do
        alice = Fabricate(:user)
        bob = Fabricate(:user)
        set_current_user(alice)
        relationship = Fabricate(:relationship, follower_id: alice.id, leader_id: bob.id)
        delete :destroy, id: relationship.id
        expect(Relationship.count).to eq(0)
      end
  
      it "redirects to the people page" do
         alice = Fabricate(:user)
        set_current_user(alice)
        bob = Fabricate(:user)
        relationship = Fabricate(:relationship, follower_id: alice.id, leader_id: bob.id)
        delete :destroy, id: relationship.id
        expect(response).to redirect_to people_path
      end
  
      it "does not delete the relationship if the current user is not the follower" do
        alice = Fabricate(:user)
        set_current_user(alice)
        bob = Fabricate(:user)
        charlie = Fabricate(:user)
        relationship = Fabricate(:relationship, follower_id: charlie.id, leader_id: bob.id)
        delete :destroy, id: relationship.id
        expect(Relationship.count).to eq(1)    
      end
      
    end
  
    describe "POST Create" do
      
      it_behaves_like "require sign in" do
      let(:action) { post :create, leader_id: 3 }
      end
      
      it "creates a relationship that current user follows the leader" do
        alice = Fabricate(:user)
        bob = Fabricate(:user)
        set_current_user(alice)
        post :create, leader_id: bob.id
        expect(alice.following_relationships.first.leader).to eq(bob)
        
      end
      
      it "redirects to the people page" do
        alice = Fabricate(:user)
        bob = Fabricate(:user)
        set_current_user(alice)
        post :create, leader_id: bob.id
        expect(response).to redirect_to people_path
      end
      
      it "does not create a relationship if current user already follows the leader" do
        alice = Fabricate(:user)
        bob = Fabricate(:user)
        set_current_user(alice)
        Fabricate(:relationship, leader_id: bob.id, follower_id: alice.id)
        post :create, leader_id: bob.id
        expect(Relationship.count).to eq(1)
    end
      
      it "does not create a relationship of if the current user is the same as the leader" do
      alice = Fabricate(:user)
      bob = Fabricate(:user)
      set_current_user(alice)
      post :create, leader_id: alice.id
      expect(Relationship.count).to eq(0)
      end
     
    end
    end
