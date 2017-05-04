Feature: Login
  As a User
  I want to login into my google mail account

  Background:
    Given I am on Inbox page

#  Scenario: Logout from inbox
#    When I click at Google Account menu button
#    And I click at Sign Out button
#    Then I logged out

#  Scenario: Compose email and sent to myself
#    Given I have opened Compose email pop up
#    When I enter my email in CC field
#      And I enter Subject
#      And I click Send button
#    Then email is visible on Inbox page

  Scenario: Delete email
    When I open email
    And I click at Delete button
    Then email is not present in Inbox folder
    And email is in the Trash folder

# Scenario: New Message window Save and Close button