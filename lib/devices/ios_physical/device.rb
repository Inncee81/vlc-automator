require 'test_environment.rb'
# Device class for standard iOS Simulator Appium config
class Device
  CAPABILITIES = {
    caps: {
      # General settings
      automationName: 'XCUITest',
      platformName: 'iOS',
      platformVersion: '10.3',
      deviceName: 'iPhone 6',
      app: File.join(TestEnvironment::APP_PATH, TestEnvironment::IOS_APP),
      browserName: '',
      newCommandTimeout: TestEnvironment::IMPLICIT_WAIT,
      language: 'en',
      locale: 'en_US',
      uuid: '',
      orientation: 'PORTRAIT', # 'LANDSCAPE'
      autoWebview: false,
      noReset: false,
      fullReset: false,
      eventTimings: true,
      enablePerformanceLogging: false,
      printPageSourceOnFindFailure: true,
      # iOS specific settings
      calendarFormat: 'gregorian',
      bundleId: '', # com.whapps.erp
      udid: '',
      launchTimeout: TestEnvironment::LAUNCH_TIMEOUT,
      locationServicesEnabled: false, # Sim only setting
      locationServicesAuthorized: false, # Sim only
      autoAcceptAlerts: false, # doesn't work with XCUITest
      autoDismissAlerts: false, # same as above
      nativeInstrumentsLib: false,
      nativeWebTap: true, # Sim only
      safariInitialUrl: '', # Sim only Set initial Safari URL
      safariAllowPopups: false, # Sim only
      safariIgnoreFraudWarning: false, # Sim ony
      safariOpenLinksInBackground: false, # Sim only
      keepKeyChains: true, # Sim only
      localizableStringsDir: 'en.lproj',
      # processArguments: '',
      interKeyDelay: TestEnvironment::KEY_DELAY,
      showIOSLog: true,
      sendKeyStrategy: 'grouped',
      screenshotWaitTimeout: TestEnvironment::SCRSHOT_TIMEOUT,
      waitForAppScript: '', # must return js boolean
      webviewConnectRetries: TestEnvironment::RETRIES,
      appName: TestEnvironment::APP_NAME,
      # customSSLCert: '',
      # webkitResponseTimeout: ,
      # XCUITest settings (https://github.com/appium/appium-xcuitest-driver#desired-capabilities)
      # wdaLocalPort: ,
      showXcodeLog: false,
      iosInstallPause: 0
      # xcodeOrgId: ,
      # xcodeSigningId: ,
      # xcodeConfigFile: ,
      # updatedWDABundleId: ,
      # keychainPath: ,
      # keychainPassword: ,
      # usePrebuiltWDA: ,
      # derivedDataPath: ,
      # preventWDAAttachments: ,
      # webDriverAgentUrl: ,
      # useNewWDA: ,
      # wdaLaunchTimeout: ,
      # wdaConnectionTimeout: ,
      # resetOnSessionStartOnly: ,
      # commandTimeouts: ,
      # wdaStartupRetries: ,
      # wdaStartupRetryInterval: ,
      # connectHardwareKeyboard: ,
      # maxTypingFrequency: ,
      # simpleIsVisibleCheck: ,
      # useCarthageSsl: ,
      # shouldUseSingletonTestManager: ,
      # startIWDP: ,
      # calendarAccessAuthorized: ,
      # isHeadless: ,
      # webkitDebugProxyPort: ,
      # useXctestrunFile: ,
      # absoluteWebLocations: ,
      # simulatorWindowCenter: ,
      # useJSONSource: ,
      # shutdownOtherSimulators: ,
      # keepKeyChains: ,
      # keychainsExcludePatterns: ,
      # realDeviceScreenshotter:
    },
    # Special configs for Sauce... I think
    appium_lib: {
      sauce_username: nil,
      sauce_access_key: nil,
      wait: 60
    }
  }.freeze
end
