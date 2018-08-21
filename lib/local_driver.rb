require 'date'
require 'test_environment.rb'
require 'mobile_application.rb'

# Class for setting up local execution on simulator/emulator or attached physical device
class LocalDriver
  attr_reader :app
  attr_reader :log_directory
  attr_accessor :instance

  def initialize(device)
    @device = device
    @instance = Appium::Driver.new(@device.desired_caps, true).start_driver
  end

  def capture_state(name); end

  def log_time
    Time.now.strftime('_%Y-%m-%dT%H:%M:%S.%L')
  end
end
