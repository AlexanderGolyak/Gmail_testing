#Global variables that are user for checking number of new emails
INBOX1 = "Inbox (1)"
INBOX2 = "Inbox (2)"

Given(/^I am logged as (.*)$/) do |user_id|
  visit LoginPage
  if on(OldLoginPage).email_field_element.exists?
    on(OldLoginPage) do |page|
      case user_id
        when 'account1'
          page.sign_in_old_page(:account1)
      end
    end
  else
    on(LoginPage) do |page|
      case user_id
        when 'account1'
          page.sign_in(:account1)
      end
    end
  end

end

When(/^I click at Google Account menu button$/) do
  on(InboxPage).account_menu_element.click
end

And(/^I click at Sign Out button$/) do
  on(InboxPage).sign_out_button_element.click
end

Then(/^I logged out$/) do
  expect(on(LoginPage).password_field_element.when_present).to be(true)
end

Given(/^I have opened Compose email pop up$/) do
  on(InboxPage).compose_button_element.click
end

When(/^I enter my email in CC field$/) do
  on(InboxPage).email_to_field_element.send_keys "rubyautomationtraining@gmail.com"
end

And(/^I enter Subject$/) do
  on(InboxPage).subject_field_element.send_keys "Test subject"
end


And(/^I click Send button$/) do
  on(InboxPage).send_button_element.click
end

Then(/^email is visible on Inbox page$/) do
  visit InboxPage
  expect(on(InboxPage).sent_email_subject_element.when_present.exists?).to be(true)
end

When(/^I open email$/) do
  on(InboxPage).sent_email_subject_element.click
end

And(/^I click at Delete button$/) do
  on(InboxPage).delete_email_button_element.when_present.element.wd.click
end

Then(/^email is not present in Inbox folder$/) do
  visit InboxPage
  sleep 1
  expect(on(InboxPage).sent_email_subject_element.exists?).to be(false)
end

And(/^email is in the Trash folder$/) do
  visit TrashFolderPage
  sleep 2
  expect(on(TrashFolderPage).deleted_email_subject_element.exists?).to be(true)
end

Given(/^I am in Trash folder$/) do
  sleep 2
  visit TrashFolderPage
end

When(/^I open mail$/) do
  sleep 2
  on(TrashFolderPage).deleted_email_subject_element.when_present.element.wd.click
end

And(/^I open Move menu$/) do
  sleep 2
  on(TrashFolderPage).remove_label_trash_element.when_present.element.wd.click
end

And(/^I click at Inbox option$/) do
  on(TrashFolderPage).inbox_button2_element.when_present.element.wd.click
end

Then(/^email is restored into Inbox folder$/) do
  # sleep 1
  visit InboxPage
  expect(on(InboxPage).sent_email_subject_element.exists?).to be(true)
end

And(/^I have entered email and Subject$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.email_to_field_element.send_keys "rubyautomationtraining@gmail.com"
    # sleep 5
    inbox_page.subject_field_element.send_keys "Test subject"
  end
end

When(/^I click at Close button$/) do
  on(InboxPage).close_compose_popup_button_element.element.wd.click
end

Then(/^email is saved into drafts folder$/) do
  visit DraftsFolderPage
  expect(on(DraftsFolderPage).drafted_email_subject_element.exists?).to be(true)
end


And(/^I remove mail from Trash folder to Inbox$/) do
  on(TrashFolderPage).remove_label_trash_element.element.wd.click
end

Given(/^I have no unread emails$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.top_page_buttons_element.when_present.element.wd.click
    inbox_page.all_mail_checkbox_2_element.when_present.element.wd.click
    # inbox_page.all_mail_checkbox_element.when_present.element.wd.click
    inbox_page.top_page_buttons_element.when_present.element.wd.click
    inbox_page.delete_all_emails_button_element.when_present.element.wd.click
  end
end

When(/^I have new email$/) do
  step "I have opened Compose email pop up"
  step "I enter my email in CC field"
  step "I enter Subject"
  step "I click Send button"
end


Then(/^Inbox counter displays that i have one unread email$/) do
  # sleep 2
  visit InboxPage
  expect(on(InboxPage).inbox_locator_element.when_present.text == INBOX1).to be(true)
end

Then(/^Inbox counter shows that i have two unread emails$/) do
  # sleep 2
  visit InboxPage
  expect(on(InboxPage).inbox_locator_element.text == INBOX2).to be(true)
end

When(/^I read email$/) do
  on(InboxPage).email_for_open_element.when_present.element.wd.click
end

Then(/^Inbox counter shows new updated number of unread emails$/) do
  # sleep 2
  visit InboxPage
  expect(on(InboxPage).inbox_locator_element.text == INBOX1).to be(true)
end

When(/^I enter my email in TO field for (.*)$/) do |email_to|
  on(InboxPage) do |page|
    case email_to
      when 'email_content1'
        page.enter_email(:email_content1)
    end
  end
end

And(/^I enter Subject for (.*)$/) do |subject|
  on(InboxPage) do |page|
    case subject
      when 'email_content1'
        page.enter_subject(:email_content1)
    end
  end
end