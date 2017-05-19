class TrashFolderPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://mail.google.com/mail/#trash'

  span(:deleted_email_subject, xpath: ".//div[7]/div[3]/div/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]/div[4]/div[1]/div[1]/table/tbody/tr[1]/td[6]/div[1]/div[1]/div[1]/span[text()='Test subject']")
  div(:moveto_button, xpath: "//div[@style='margin-right: 0px;']/div[1]/div/div[4]/div[1]")
  div(:inbox_button, xpath: "//div[@style='-moz-user-select: none; left: 485.367px; top: 77px;']/div/div[5]/div[text()='Inbox']")
  div(:inbox_button2, xpath: "html/body/div[20]/div/div[5]/div[text()='Inbox']")
  span(:remove_label_trash, xpath: "//span[@title='Remove label Trash from this conversation']")


end