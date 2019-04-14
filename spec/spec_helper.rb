Dir.glob("spec/**/*steps.rb") { |f| load f, true }

require 'capybara/dsl'
require 'capybara/rspec'
require 'turnip'
require 'turnip/capybara'

Capybara.default_driver = :selenium
Capybara.ignore_hidden_elements = true
Capybara.run_server = false

# Chrome
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
