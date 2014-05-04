Feature: Home page
  In order to know who is visiting cabin next
  As a user
  I want a page that shows me information about next visits

  Scenario: Home page shows next visit
    Given I have logged in
    When I am on the home page
    And there is a visit scheduled to a cabin in the future
    Then I should see the visit information

  Scenario: Home page shows no visits info
    Given I have logged in
    When I am on the home page
    And there are no future visits
    Then I should see no future visits