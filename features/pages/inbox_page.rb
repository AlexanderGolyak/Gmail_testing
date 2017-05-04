class InboxPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://mail.google.com/mail/'

  # span(:access_to_another_acc, xpath: "//*[@id='view_container']/form/div[1]/div/div/div[2]/div/content/span/span")
  # div(:use_another_account, xpath: "//*[@id='identifierLink']/div[2]/p/text()")
  # text_field(:login_field, css: '#identifierId')
  # text_field(:password_field, xpath: "//*[@aria-label='Enter your password']")
  # div(:next_button, css: '#identifierNext')
  # div(:password_next_button, css: '#passwordNext')
  span(:account_menu, xpath: "//*[@id='gb']/div[1]/div[1]/div[2]/div[4]/div[1]/a/span")
  a(:sign_out_button, xpath: ".//a[text()='Sign out']")
  div(:compose_button, xpath: ".//div[text()='COMPOSE']")
  text_area(:email_to_field, xpath: ".//*[@aria-label='To']")
  text_field(:subject_field, xpath: ".//*[@name='subjectbox']")
  div(:send_button, xpath: ".//div[text()='Send']")
  span(:sent_email_subject, xpath: ".//span[text()='Test subject']")
  a(:inbox_locator, xpath: ".//*[@href='https://mail.google.com/mail/#inbox']")
  div(:delete_email_button, xpath: ".//*[@aria-label='Delete']")
  span(:more_folders_button, xpath: ".//span[text()='More']")
  a(:trash_folder_button, xpath: ".//*[@href='https://mail.google.com/mail/#trash' and @title='Trash']")
end