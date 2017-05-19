Feature: Login
  As a User
  I want to login into my google mail account

  Background:
    Given I am on login page

  Scenario: Login with valid credentials
    When I click at arrow button
    And I click at Use another account button
    And I enter email for account1
    And I click Next button
    And I enter password for account1
    And I click Next button
    Then I logged in