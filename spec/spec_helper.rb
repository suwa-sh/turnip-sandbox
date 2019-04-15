Dir.glob("spec/**/*steps.rb") { |f| load f, true }

require 'capybara/dsl'
require 'capybara/rspec'
require 'turnip'
require 'turnip/capybara'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Capybara.ignore_hidden_elements = true
Capybara.run_server = false

# Chrome
Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('headless')
  options.add_argument('--disable-gpu')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
