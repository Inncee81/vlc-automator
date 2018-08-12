desc 'Executes tests against an Android 4.4 emulator'
Rake::TestTask.new(:android_emulator) do |t|
  t.warning = false
  t.libs = %w[lib test screens lib/devices/android_emulator]
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Executes tests against an Android physical device'
Rake::TestTask.new(:android_device) do |t|
  t.warning = false
  t.libs = %w[lib test screens lib/devices/android_physical]
  t.test_files = FileList['test/**/*_test.rb']
end
