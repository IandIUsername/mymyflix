require 'spec_helper'

feature "user resets password" do
  scenario "user successfully resets the password"  do
    alice = Fabricate(:user, password: 'old_password')
    visit sign_in_path
    click_link "Forgot password?"
    fill_in "Your Email, Please", with: alice.email
    click_button "Send Email"
    
    open_email(alice.email)
    puts alice.email
    puts current_email.inspect
    puts current_email.body.inspect
    # if I comment out current_email.click_link and paste in the reset password link with token arrive at expired token page, is this just because of the difference between test and development enviros?
    current_email.click_link("Reset My Password")
    expect(page).to have_content("Reset Your Password")
    
    fill_in "New Password", with: "new_password"
    #click_button "dog" fails, but click button Reset Password works
    click_button "Reset Password"
    #puts session[:id]
    #expect(page).not_to have_content("Your reset password link is expired.")
    #raise params.inspect in the create action password resets controller returns:
#   5) PasswordResetsController POST create with valid token redirects to the sign in page                     
#    Failure/Error: post :create, token: '12345', password: 'new_password'                                   
#    RuntimeError:                                                                                           
#      {"token"=>"12345", "password"=>"new_password", "controller"=>"password_resets", #"action"=>"create"} 
    #raise alice.inspect
    #expect(page).to have_content("Your reset password link is expired.")
    #expect(response).to redirect_to sign_in_path
    #expect(page).to have_content("Unlimited Movies for Only 9.99 a Month.")
    puts "page => #{current_scope}"
    #expect(page).to have_content("Sign in")
#     expect(page).to have_content("Your password has been updated")
    #password has been updated")
    puts "page2 => #{current_url}" 

    fill_in 'email address', with: alice.email
    fill_in 'password', with: "new_password"
    click_button "Sign in"
    expect(page).to have_content("Welcome, #{alice.full_name}")
    
    
    clear_email
  end
end