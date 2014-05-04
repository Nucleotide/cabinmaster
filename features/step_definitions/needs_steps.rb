User.create(name: "testiukko", password: "hello", password_confirmation: "hello")
Cabin.create(name: "mokki")
Need.create(info: "tarve", cabin_id: 1, user_id: 1)

Given(/^I am on the needs page$/) do
  visit 'needs#index'
end

When(/^I click New Need$/) do
  click_link 'New Need'
end

When(/^I fill in Info$/) do
  fill_in 'Info', :with => "makkara"
end

When(/^I click Create Need$/) do
  click_button 'Create Need'
end

Then(/^I should see Need was successfully created$/) do
  expect(page).to have_content 'Need was successfully created'
end

When(/^I don't fill in Info$/) do
  fill_in 'Info', :with => ""
end

Then(/^I should see Info can't be blank$/) do
  expect(page).to have_content "Info can't be blank"
end

When(/^I click destroy$/) do
  click_link 'Destroy', :match => :first
end

Then(/^I should see Need was successfully destroyed$/) do
  expect(page).to have_content 'Need was successfully destroyed'
end

When(/^I click edit$/) do
  click_link 'Edit', :match => :first
end

When(/^I edit Info$/) do
  fill_in 'Info', :with => "I love editing"
end

When(/^I click Update Need$/) do
  click_button 'Update Need'
end

Then(/^I should see Need was successfully updated$/) do
  expect(page).to have_content 'Need was successfully updated'
end