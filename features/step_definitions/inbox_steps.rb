Given(/^I am on Inbox page$/) do
  visit LoginPage
  on(LoginPage) do |login_page|
    login_page.access_to_another_acc_element.click if login_page.access_to_another_acc_element.exists?
    login_page.use_another_account_element.click if login_page.use_another_account_element.exists?
    login_page.login_field_element.click
    login_page.login_field_element.send_keys "rubyautomationtraining@gmail.com"
    if login_page.next_button_element.exists?
      login_page.next_button_element.element.wd.click
    else
      login_page.password_next_button_element.element.wd.click
    end
    login_page.password_field_element.send_keys "1qaz!QAZ1q"
    if login_page.next_button_element.exists?
      login_page.next_button_element.element.wd.click
    else
      login_page.password_next_button_element.element.wd.click
    end
  end
end

When(/^I click at Google Account menu button$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.account_menu_element.click
  end
end

And(/^I click at Sign Out button$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.sign_out_button_element.click
  end
end

Then(/^I logged out$/) do
  on(LoginPage) do |login_page|
    expect(login_page.password_field_element).to be
  end
end

Given(/^I have opened Compose email pop up$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.compose_button_element.click
  end
end

When(/^I enter my email in CC field$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.email_to_field_element.send_keys "rubyautomationtraining@gmail.com "
    sleep 5
  end
end

# i cant focus because pop up blocks or because i dont know how to access input in locator
And(/^I enter Subject$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.subject_field_element.send_keys "Test subject"
  end
end


And(/^I click Send button$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.send_button_element.click
  end
end

Then(/^email is visible on Inbox page$/) do
  on(InboxPage) do |inbox_page|
    expect(inbox_page.sent_email_subject_element.exists?).to be(true)
  end
end

When(/^I open email$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.sent_email_subject_element.click
  end
end

And(/^I click at Delete button$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.delete_email_button_element.click
  end
end

Then(/^email is not present in Inbox folder$/) do
  on(InboxPage) do |inbox_page|
    expect(inbox_page.sent_email_subject_element.exists?).to be(false)
  end
end

And(/^email is in the Trash folder$/) do
  on(InboxPage) do |inbox_page|
    inbox_page.more_folders_button_element.click
    inbox_page.trash_folder_button_element.click
    expect(inbox_page.sent_email_subject_element.exists?).to be(true)
  end
end