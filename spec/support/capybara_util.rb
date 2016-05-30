module CapybaraUtil
  class << self
    # register a Selenium driver for the given browser to run on the localhost
    def register_selenium_local_driver(browser)
      Capybara.register_driver "selenium_#{browser}".to_sym do |app|
        Capybara::Selenium::Driver.new(app, browser: browser)
      end
    end

    # register a Selenium driver for the given browser to run with a Selenium
    # Server on another host
    def register_selenium_remote_driver(browser)
      Capybara.register_driver "selenium_remote_#{browser}".to_sym do |app|
        Capybara::Selenium::Driver.new(app, browser: :remote, url: "http://selenium:4444/wd/hub", desired_capabilities: browser)
      end
    end

    def selenium_remote?
      !(Capybara.current_driver.to_s =~ /\Aselenium_remote/).nil?
    end
  end
end
