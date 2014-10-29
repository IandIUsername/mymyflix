

require 'spec_helper'



feature "User invites friends" do
  scenario 'user successfully invites friend and invitation is accepted' do
    clear_email
    alice = Fabricate(:user)
    sign_in(alice)
    visit new_invitation_path
    fill_in "Friend's name", with: "John Doe"
    fill_in "Friend's email", with: "john@example.com"
    fill_in "Message", with: "hello please join"
    click_button "Send Invitation"
    sign_out
    
    #require 'pry'; binding.pry
    
    open_email "john@example.com"
    current_email.click_link "Accept this invitation"

    #require 'pry'; binding.pry
    
    fill_in "Password", with: "password"
    fill_in "Full Name", with: "John Doe"
    click_button "Sign Up"
    
    fill_in "email address", with: "john@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    
    click_link "People"
    expect(page).to have_content alice.full_name
    sign_out
    
    sign_in(alice)
    click_link "People"
    expect(page).to have_content "John Doe"
    
    clear_email
  end
end