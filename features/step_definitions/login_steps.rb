Given(/^I am on login page$/) do
  visit LoginPage
end

When(/^I click at arrow button$/) do
  on(LoginPage) do |login_page|
    login_page.access_to_another_acc_element.click if login_page.access_to_another_acc_element.exists?
  end
end

When(/^I click at Use another account button$/) do
  on(LoginPage) do |login_page|
    login_page.use_another_account_element.click if login_page.use_another_account_element.exists?
  end
end

And(/^I enter valid email/) do
  on(LoginPage) do |login_page|
    login_page.login_field_element.click
    login_page.login_field_element.send_keys "rubyautomationtraining@gmail.com"
  end
end

And(/^I click Next button$/) do
  on(LoginPage) do |login_page|
    if login_page.next_button_element.exists?
      login_page.next_button_element.element.wd.click
    else
      login_page.password_next_button_element.element.wd.click
    end
  end
end

And(/^I enter valid password$/) do
  on(LoginPage) do |login_page|
    login_page.password_field_element.send_keys "1qaz!QAZ1q"
  end
end

Then(/^I logged in$/) do
  sleep 5
  on(InboxPage) do |inbox_page|
    expect(inbox_page.inbox_locator_element.exists?).to be(true)
  end
end

