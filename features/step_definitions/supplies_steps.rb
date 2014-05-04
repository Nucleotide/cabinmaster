User.create(name: "testiukko", password: "hello", password_confirmation: "hello")
Cabin.create(name: "mokki")
Supply.create(info: "tarve", cabin_id: 1, user_id: 1)

Given(/^I am on the supplies page$/) do
  visit 'supplies#index'
end

When(/^I click New Supply$/) do
  click_link 'New Supply'
end

When(/^I click Create Supply$/) do
  click_button 'Create Supply'
end

Then(/^I should see Supply was successfully created$/) do
  expect(page).to have_content 'Supply was successfully created'
end

Then(/^I should see Supply was successfully destroyed$/) do
  expect(page).to have_content 'Supply was successfully deleted'
end

When(/^I click Update Supply$/) do
  click_button 'Update Supply'
end

Then(/^I should see Supply was successfully updated$/) do
  expect(page).to have_content 'Supply was successfully updated'
end