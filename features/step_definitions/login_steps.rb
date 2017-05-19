Given(/^I am on login page$/) do
  visit LoginPage
end

When(/^I click at arrow button$/) do
  on(LoginPage) { |login_page| login_page.access_to_another_acc_element.click if login_page.access_to_another_acc_element.exists? }
end


When(/^I click at Use another account button$/) do
  on(LoginPage) { |login_page| login_page.use_another_account_element.click if login_page.use_another_account_element.exists? }
end

And(/^I enter email for (.*)$/) do |user_id|
  on(LoginPage) do |page|
    case user_id
      when 'account1'
        page.enter_email(:account1)
    end
  end
end

And(/^I enter password for (.*)$/) do |user_id|
  on(LoginPage) do |page|
    case user_id
      when 'account1'
        page.enter_password(:account1)
    end
  end
end

And(/^I click Next button$/) do
  on(LoginPage) do |login_page|
    if login_page.next_button_element.exists?
      login_page.next_button_element.when_present.element.wd.click
    else
      login_page.password_next_button_element.when_present.element.wd.click
    end
  end
end

Then(/^I logged in$/) do
  expect(on(InboxPage).inbox_locator_element.when_present.exists?).to be(true)
end

