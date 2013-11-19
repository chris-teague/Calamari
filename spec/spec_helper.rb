require 'cover_me'

# Ensure we're running the tests in the test environment
ARGV[0] = 'test'
$LOAD_PATH.push File.join(File.dirname(__FILE__), "..", "config")

# Environment loading.
require 'calamari'

require 'factory_girl'
FactoryGirl.find_definitions

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
Dir[File.join(File.dirname(__FILE__), "..", "spec/support/**/*.rb")].each { |f| load f }

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

end
