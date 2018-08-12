class MobileApplication
  def initialize(capabilities)
    # not going to bind anything other than the Appium config
    @config = capabilities[:caps]
  end

  def platform
    @config[:platformName].to_s + '_' + \
      @config[:platformVersion].to_s
  end

  def device
    hardware = @config[:uuid].to_s
    hardware.empty? ? hardware = 'SIMULATOR' : hardware
    @config[:deviceName].to_s + '_' + hardware
  end

  def localization
    @config[:language].to_s + '_' + @config[:locale].to_s
  end

  def backend
    @config[:automationName].to_s
  end
end
