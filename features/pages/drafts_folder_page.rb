class DraftsFolderPage
  include PageObject

  page_url ENV['PAGE_URL']||'https://mail.google.com/mail/#drafts'

  span(:drafted_email_subject, xpath: ".//span[text()='Test subject']")

end