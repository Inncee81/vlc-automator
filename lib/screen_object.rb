module ScreenObject
  # Generic "screen" object aking to Selenium's page object
  class Screen
    attr_accessor :driver

    def initialize(driver)
      @driver = driver
    end
  end
end
