Feature: Session
    In order to use the system
    As a user
    I need to login

    Scenario: login
        Given I am on the login page
        And I have entered my username
        And I have entered my password
        When I click login
        Then I should be on home page

    Scenario: login fails
        Given I am on the login page
        And I enter invalid password
        When I click login
        Then I should not be logged in

    Scenario: logout
        Given I have logged in
        When I click logout
        Then I should be on login page