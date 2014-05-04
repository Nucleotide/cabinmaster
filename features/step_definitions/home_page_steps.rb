User.create(name: "testiukko", password: "hello", password_confirmation: "hello")
Cabin.create(name: "mokki")

When(/^I am on the home page$/) do
  visit 'cabins#index'
end

When(/^there is a visit scheduled to a cabin in the future$/) do
  Visit.create(cabin_id: 1, user_id: 1, start_date: Date.today+1, end_date: Date.today+3)
end

Then(/^I should see the visit information$/) do
  expect(page).to have_content 'Next visit:'
end

When(/^there are no future visits$/) do
  Cabin.destroy_all
end

Then(/^I should see no future visits$/) do
  expect(page).to have_content 'No visits'
end