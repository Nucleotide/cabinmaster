Feature: Needs
  In order to know what I need to the cabin
  As a user of the system
  I need to be able to CRUD needs on the system

  Scenario: Add need
    Given I have logged in
    And I am on the needs page
    When I click New Need
    And I fill in Info
    And I click Create Need
    Then I should see Need was successfully created

  Scenario: Add need with invalid data
    Given I have logged in
    And I am on the needs page
    When I click New Need
    And I don't fill in Info
    And I click Create Need
    Then I should see Info can't be blank

  Scenario: Delete need
    Given I have logged in
    And I am on the needs page
    When I click destroy
    Then I should see Need was successfully destroyed

  Scenario: Edit need
    Given I have logged in
    And I am on the needs page
    When I click edit
    And I edit Info
    And I click Update Need
    Then I should see Need was successfully updated

  Scenario: Edit need can't save invalid info
    Given I have logged in
    And I am on the needs page
    When I click edit
    And I don't fill in Info
    And I click Update Need
    Then I should see Info can't be blank