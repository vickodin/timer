Given /^(?:.*) go to the (?:root|home) page$/ do
  visit "/"
end

Given /^(?:.*) go to the signup page$/ do
  visit signup_url
end

Given /^(?:.*) go to the login page$/ do
  visit login_url
end

Then /^(?:.*) should see "([^"]*)"$/ do |arg1|
  #  pending # express the regexp above with the code you wish you had
  page.should have_content(arg1)
end

Given /^(?:.*) fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end

When /^(?:.*) press "(.*?)"$/ do |arg1|
  #pending # express the regexp above with the code you wish you had
  puts "iii:"
  puts @user.username
  puts User.count
  click_button(arg1)
end

Then /^(?:.*) should be on the home page$/ do
  #pending # express the regexp above with the code you wish you had
  current_path.should == root_path
end


Given /^([^"]*) has email "([^"]*)" and password "([^"]*)"$/ do |username, email, password|
  @user = User.new(:username => username, :email => email, :password => password, :password_confirmation => password)
end

