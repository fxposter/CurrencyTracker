Given /^I am a logged in user$/ do
  email = 'user@example.com'
  password = 'secretpass'
  User.create!(:email => email, :password => password, :password_confirmation => password)

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end
