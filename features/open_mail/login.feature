@manager @accountholder @supervisor @payperiods @attendance
Feature: Managing Pay Periods
  As a Account Holder / Manager
  I want to manage Pay Periods

  Background:
    Given I am on login page

  @happypath @accountholder @manager
  Scenario: Add Pay Period
    When I enter valid login
      And I enter valid password
      And I click Login button
    Then I logged in
