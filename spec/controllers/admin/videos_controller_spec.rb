require 'spec_helper'

describe Admin::VideosController do
describe "GET new" do
  it_behaves_like "require sign in" do
    let(:action) { get :new }
  end
  it "sets the @video variable to a new video" do
    set_current_user
    get :new
    expect(assigns(:video)).to be_instance_of Video
    expect(assigns(:video)).to be_new_record
  end
  it "redirects the non-admin signed in user to the home path"
  it "sets the flash error message for a signed in non-admin user"
end
end