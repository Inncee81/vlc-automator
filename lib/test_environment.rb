# Module containing universal characteristics of the test environment 
# that will be consistent for all test processes
module TestEnvironment
  RETRIES = 10 # Amount of times to retry 
  IMPLICIT_WAIT = 10 # seconds to wait for GUI elements to be present/usable
  DEVICE_TIMEOUT = 5 # seconds to wait for the device to respond to requests
  BOOT_TIMEOUT = 60 # seconds to wait for the device to boot
  SCRSHOT_TIMEOUT = 3 # seconds to wait for the screenshot to capture
  INSTALL_TIMEOUT = 90_000 # milliseconds to wait for app installation
  LAUNCH_TIMEOUT = 12_000 # milliseconds to wait for app launch
  KEY_DELAY = 100 # milliseconds between keypresses
  APP_NAME = 'VLC'.freeze
  APP_PATH = File.join(__dir__, '..', 'bin').freeze
  LOG_DIR = File.join(__dir__, '..', 'log').freeze
  Dir.mkdir(LOG_DIR) unless File.exist?(LOG_DIR)

  # Native, simulator, and emulator binaries
  # Regex is used so that any verion of the official build will be detected
  ANDROID_ARM7 = Dir[File.join(APP_PATH,'[a-zA-Z\-\.0-9]*-ARMv7\.apk')].first.freeze
  ANDROID_ARM8 = Dir[File.join(APP_PATH,'[a-zA-Z\-\.0-9]*-ARMv8\.apk')].first.freeze
  ANDROID_X86 = Dir[File.join(APP_PATH,'[a-zA-Z\-\.0-9]*-x86\.apk')].first.freeze
  ANDROID_X86_64 = Dir[File.join(APP_PATH,'[a-zA-Z\-\.0-9]*-x86_64\.apk')].first.freeze
  IOS_NATIVE = Dir[File.join(APP_PATH,'[a-zA-Z\-\.0-9]*\.ipa')].first.freeze
  IOS_SIMULATOR = Dir[File.join(APP_PATH,'[a-zA-Z\-\.0-9]*\.app')].first.freeze

  # Custom exception for passing invalid config arguments
  class BadAppConfigError < StandardError
    attr_reader :message
    def initialize(message = nil)
      @message = message
    end
  end

  # Custom exception for bad capability hashes
  class BadCapabilityError < StandardError
    attr_reader :message
    def initialize(message = nil)
      @message = message
    end
  end
end
