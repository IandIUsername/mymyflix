require 'spec_helper'

feature "user resets password" do
  scenario "user succesully resets the password"  do
    alice = Fabricate(:user, password: 'old_password')
    visit sign_in_path
    click_link "Forgot password?"
    fill_in "Your Email, Please", with: alice.email
    click_button "Send Email"
    
    open_email(alice.email)
    current_email.click_link("Reset My Password")
    fill_in "New Password", with: "new_password"
    click_button "Reset Password"
    

    fill_in 'email address', with: alice.email
    fill_in 'password', with: "new_password"
    click_button "Sign in"
    expect(page).to have_content("Welcome, #{alice.full_name}")
    
    
    
  end
end