require 'bundler/setup'
require 'page-object'
require 'page-object/page_factory'
require 'yaml'
require 'logger'
require 'open-uri'
require 'net/http'
require 'net/https'
require 'uri'
require 'mechanize'
require 'anemone'
require 'parallel_tests'
require 'date'
require 'securerandom'
require 'rest-client'

=begin
Before do |scenario|
  @browser = Watir::Browser.new
  @metadata = Hash.new
  @metadata[:feature] = scenario.feature.name
  @metadata[:scenario] = scenario.name
  @metadata[:tags] = scenario.source_tag_names
end

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
=end

World(PageObject::PageFactory)

if ENV['HEADLESS']
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
end

Before do
  @browser = Watir::Browser.new
  @browser.driver.manage.window.maximize
end

# after do
#   @browser.close
# end

# $accounts =
#     {
#         "Account1" => ["rubyautomationtraining@gmail.com", "1qaz!QAZ1q"],
#     }

#why its not blue as in other project?
# data = {"username" => "#{$accounts["Account1"][0]}", "password" => "#{$accounts["Account1"][1]}"}