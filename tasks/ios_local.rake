desc 'Executes tests against an iOS 10.4 simulator'
Rake::TestTask.new(:ios_simulator) do |t|
  t.warning = false
  t.libs = %w[lib test screens lib/devices/ios_simulator]
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Executes tests against an iOS physical device'
Rake::TestTask.new(:ios_device) do |t|
  t.warning = false
  t.libs = %w[lib test screens lib/devices/ios_physical]
  t.test_files = FileList['test/**/*_test.rb']
end
