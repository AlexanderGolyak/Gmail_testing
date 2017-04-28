require 'watir-webdriver'
require 'selenium-webdriver'
require 'page-object'

Before do |scenario|
  @browser = Watir::Browser.new
  @metadata = Hash.new
  @metadata[:feature] = scenario.feature.name
  @metadata[:scenario] = scenario.name
  @metadata[:tags] = scenario.source_tag_names
end

# Before do
#   @browser = Watir::Browser.new
# end

After do |scenario|
  if scenario.failed?
    screenshot_file = "FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime('%Y%m%d-%H%M%S')}.png"
    screenshot_file = File.join('report', screenshot_file)
    @browser.driver.save_screenshot(screenshot_file)
    embed(screenshot_file, 'image/png')
    @browser.close
  else
    @browser.close
  end
end