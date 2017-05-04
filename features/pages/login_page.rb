class LoginPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://gmail.com'

  span(:access_to_another_acc, xpath: "//*[@id='view_container']/form/div[1]/div/div/div[2]/div/content/span/span")
  div(:use_another_account, xpath: "//*[@id='identifierLink']/div[2]/p/text()")
  # text_field(:login_field, css: '#identifierId')
  text_field(:login_field, xpath: "//*[@aria-label='Email or phone']")
  text_field(:password_field, xpath: "//*[@aria-label='Enter your password']")
  div(:next_button, css: '#identifierNext')
  div(:password_next_button, css: '#passwordNext')



end