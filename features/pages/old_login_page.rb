class OldLoginPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://gmail.com'

  span(:access_to_another_acc, xpath: "//*[@id='view_container']/form/div[1]/div/div/div[2]/div/content/span/span")
  div(:use_another_account, xpath: "//*[@id='identifierLink']/div[2]/p/text()")

  element(:email_field, css: '#Email')
  element(:password_field, css: '#Passwd')

  def get_credentials(role)
    creds = YAML::load(File.open('credentials.yml'))
    creds[role]
  end

  def sign_in_old_page(role)
    creds = get_credentials(role)
    self.email_field = creds[:email], :enter
    self.password_field = creds[:password], :enter
  end

end
