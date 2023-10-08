Capybara.register_driver :selenium_chrome_in_container do |app|
  chrome_options = Selenium::WebDriver::Chrome::Options.new
  chrome_options.add_argument("--headless")
  chrome_options.add_argument("--disable-gpu")
  chrome_options.add_argument("--window-size=1400,1400")
  chrome_options.add_argument("--no-sandbox")
  chrome_options.add_argument("--disable-dev-shm-usage")
  Capybara::Selenium::Driver.new( app, browser: :remote, url: "http://selenium-chrome:4444/wd/hub", options: chrome_options)           
end                 