User.create(name: "testiukko", password: "hello", password_confirmation: "hello")
Cabin.create(name: "mokki")
Visit.create(cabin_id: 1, user_id: 1, start_date: Date.today+1, end_date: Date.today+5)

Given(/^I am on the visits page$/) do
  visit 'visits#index'
end

When(/^I click New Visit$/) do
  click_link 'New Visit'
end

When(/^I fill in Dates$/) do
  fill_in 'Start date', :with => Date.today+4
  fill_in 'End date', :with => Date.today+8
end

When(/^I click Create Visit$/) do
  click_button 'Create Visit'
end

Then(/^I should see Visit was successfully created$/) do
  expect(page).to have_content 'Visit was successfully created'
end

When(/^I enter invalid data$/) do
  fill_in 'Start date', :with => "Datwefe.today+4"
  fill_in 'End date', :with => "wpogj"
end

Then(/^I should see error message about dates$/) do
  expect(page).to have_content 'prohibited this visit from being saved'
end

When(/^I fill date info with past dates$/) do
  fill_in 'Start date', :with => Date.today-5
  fill_in 'End date', :with => Date.today-3
end

When(/^I edit the dates$/) do
  fill_in 'Start date', :with => Date.today+15
  fill_in 'End date', :with => Date.today+23
end

When(/^I click Update Visit$/) do
  click_button 'Update Visit'
end

Then(/^I should see Visit was successfully updated$/) do
  expect(page).to have_content 'Visit was successfully updated'
end

When(/^I edit the dates with bad dates$/) do
  fill_in 'Start date', :with => Date.today-5
  fill_in 'End date', :with => Date.today-3
end

When(/^I edit the dates with bad data$/) do
  fill_in 'Start date', :with => "Datwefe.today+4"
  fill_in 'End date', :with => "wpogj"
end

Then(/^I should see the visit was deleted$/) do
  expect(page).to have_content 'Visit was successfully canceled'
end

When(/^I click All Visits$/) do
  click_link 'All visits'
end

Then(/^I should see a list of all visits$/) do
  expect(page).to have_content 'Listing all visits'
end