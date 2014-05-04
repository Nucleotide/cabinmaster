Feature: Visits
  In order to know tell when I am going to the cabin
  As a user of the system
  I need to be able to CRUD visits

  Scenario: Add visit
    Given I have logged in
    And I am on the visits page
    When I click New Visit
    And I fill in Dates
    And I click Create Visit
    Then I should see Visit was successfully created

  Scenario: Add visit with invalid data
    Given I have logged in
    And I am on the visits page
    When I click New Visit
    And I enter invalid data
    And I click Create Visit
    Then I should see error message about dates

  Scenario: Add visit with past date
    Given I have logged in
    And I am on the visits page
    When I click New Visit
    And I fill date info with past dates
    And I click Create Visit
    Then I should see error message about dates

  Scenario: Edit visit
    Given I have logged in
    And I am on the visits page
    When I click edit
    And I edit the dates
    And I click Update Visit
    Then I should see Visit was successfully updated

  Scenario: Edit visit can't be saved with bad dates
    Given I have logged in
    And I am on the visits page
    When I click edit
    And I edit the dates with bad dates
    And I click Update Visit
    Then I should see error message about dates

  Scenario: Edit visit can't be saved with bad date data
    Given I have logged in
    And I am on the visits page
    When I click edit
    And I edit the dates with bad data
    And I click Update Visit
    Then I should see error message about dates

  Scenario: Delete visit
    Given I have logged in
    And I am on the visits page
    When I click destroy
    Then I should see the visit was deleted

  Scenario: View all visits
    Given I have logged in
    And I am on the visits page
    When I click All Visits
    Then I should see a list of all visits