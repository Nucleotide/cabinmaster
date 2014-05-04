user = User.create(name: "testiukko", password: "hello", password_confirmation: "hello")

Given(/^I am on the login page$/) do
  visit '/login'
end

Given(/^I have entered my username$/) do
  fill_in 'Username', :with => user.name
end

Given(/^I have entered my password$/) do
  fill_in 'Password', :with => "hello"
end

When(/^I click login$/) do
  click_button 'Log in'
end

Then(/^I should be on home page$/) do
  expect(page).to have_content 'Hello testiukko!'
end

Given(/^I enter invalid password$/) do
  fill_in 'Username', :with => user.name
  fill_in 'Password', :with => "enmuista"
end

Then(/^I should not be logged in$/) do
  expect(page).to have_content 'Please, sign in first'
end

Given(/^I have logged in$/) do
  visit '/login'
  fill_in 'Username', :with => user.name
  fill_in 'Password', :with => "hello"
  click_button 'Log in'
end

When(/^I click logout$/) do
  click_link 'Logout'
end

Then(/^I should be on login page$/) do
  expect(page).to have_content 'Please, sign in first'
end