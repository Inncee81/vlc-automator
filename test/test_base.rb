require 'csv'
require 'selenium-webdriver'
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/pride'
require 'test_environment.rb'
require 'mobile_application.rb'
require 'local_driver.rb'
require 'remote_driver.rb'
require 'device.rb'

# Main test class for setting up config and creating drivers
class TestBase < Minitest::Test
  def setup
    @app = MobileApplication.new(Client::CAPABILITIES)
    @driver = LocalDriver.new(@app)
    @browser = @driver.instance
  end

  def teardown
    # Takes a screen shot if the 'result_code' of the test is not
    # equal to a passing value (in minitest's case, a '.' character)
    @driver.capture_state(@NAME) unless result_code.eql?('.')
    !@browser.nil? ? @browser.quit : false
  end
end
