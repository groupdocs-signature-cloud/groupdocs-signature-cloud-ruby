require 'rake/testtask'

# rake test       - all tests (the API tests need a cloud connection, see test/test_settings.rb)
# rake test:unit  - offline tests only, no credentials required
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/test_*.rb"].exclude("test/test_context.rb", "test/test_file.rb", "test/test_settings.rb")
  t.warning = false
end

namespace :test do
  Rake::TestTask.new(:unit) do |t|
    t.libs << "test"
    t.test_files = FileList["test/models/test_*.rb", "test/test_test_files.rb"]
    t.warning = false
  end
end
