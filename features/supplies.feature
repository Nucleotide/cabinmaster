Feature: Supplies
  In order to know what supplies are on the cabin
  As a user of the system
  I need to be able to CRUD supplies on the system

  Scenario: Add supply
    Given I have logged in
    And I am on the supplies page
    When I click New Supply
    And I fill in Info
    And I click Create Supply
    Then I should see Supply was successfully created

  Scenario: Add supply with invalid data
    Given I have logged in
    And I am on the supplies page
    When I click New Supply
    And I don't fill in Info
    And I click Create Supply
    Then I should see Info can't be blank

  Scenario: Delete supply
    Given I have logged in
    And I am on the supplies page
    When I click destroy
    Then I should see Supply was successfully destroyed

  Scenario: Edit supply
    Given I have logged in
    And I am on the supplies page
    When I click edit
    And I edit Info
    And I click Update Supply
    Then I should see Supply was successfully updated

  Scenario: Edit supply can't save invalid info
    Given I have logged in
    And I am on the supplies page
    When I click edit
    And I don't fill in Info
    And I click Update Supply
    Then I should see Info can't be blank