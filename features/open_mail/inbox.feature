Feature: Login
  As a User
  I want to login into my google mail account

  Background:
    Given I am logged as account1

  Scenario: Logout from inbox
    When I click at Google Account menu button
    And I click at Sign Out button
    Then I logged out

#    Scenario: Compose email and sent to myself
#      Given I have opened Compose email pop up
#      When I enter my email in TO field for email_content1
#        And I enter Subject for email_content1
#        And I click Send button
#      Then email is visible on Inbox page


  Scenario: Compose email and sent to myself
    Given I have opened Compose email pop up
    When I enter my email in CC field
      And I enter Subject
      And I click Send button
    Then email is visible on Inbox page

  Scenario: Delete email
    When I open email
    And I click at Delete button
    Then email is not present in Inbox folder
    And email is in the Trash folder

 Scenario: Restore deleted email
  Given I am in Trash folder
  When I open mail
  And I remove mail from Trash folder to Inbox
  Then email is restored into Inbox folder

  Scenario: New Message window Save and Close button
    Given I have opened Compose email pop up
    And I have entered email and Subject
    When I click at Close button
    Then email is saved into drafts folder

  Scenario: Inbox counter is updated when unread email is arrived
    Given I have no unread emails
    When I have new email
    Then Inbox counter displays that i have one unread email
    When I have new email
    Then Inbox counter shows that i have two unread emails
