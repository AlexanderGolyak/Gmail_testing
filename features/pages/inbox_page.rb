class InboxPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://mail.google.com/mail/'

  span(:account_menu, xpath: "//*[@id='gb']/div[1]/div[1]/div[2]/div[4]/div[1]/a/span")
  a(:sign_out_button, xpath: ".//a[text()='Sign out']")
  div(:compose_button, xpath: ".//div[text()='COMPOSE']")
  text_area(:email_to_field, xpath: ".//*[@aria-label='To']")
  text_field(:subject_field, xpath: ".//*[@name='subjectbox']")
  div(:send_button, xpath: ".//div[text()='Send']")
  div(:sent_email_subject, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[7]/div[1]/div[1]/div[2]/div[1]/table/tbody/tr[1]/td[4]/div[2]")
  a(:inbox_locator, xpath: ".//*[@href='https://mail.google.com/mail/#inbox']")
  div(:delete_email_button, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]")
  span(:more_folders_button, xpath: "//span[text()='More']")
  a(:trash_folder_button, xpath: "//a[@href='https://mail.google.com/mail/#trash' and @title='Trash']")
  image(:close_compose_popup_button, xpath: "//img[@alt='Close']")
  span(:remove_trash_label, xpath: "//span[@title='Remove label Trash from this conversation']")
  div(:all_mail_checkbox, xpath: "//div[@style='margin-right: 0px;']/div/div[1]/div/div/div[1]/div[1]/div[1]/span/div")
  div(:email_for_open, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[7]/div[1]/div[1]/div[2]/div[1]/table/tbody/tr[1]/td[4]/div[2]")
  div(:top_page_buttons, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]")
  span(:all_mail_checkbox_2, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/span")
  div(:delete_all_emails_button, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[3]")

  def get_email_content(content)
    creds = YAML::load(File.open('email_info.yml'))
    creds[content]
  end

  def enter_email(content)
    creds = get_email_content(content)
    self.email_to_field = creds[:email]
  end

  def enter_subject(content)
    creds = get_email_content(content)
    self.subject_field = creds[:subject]
  end


end