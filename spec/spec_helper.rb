require 'rspec'
require 'money'
require 'rake'

RSpec.configure do |config|
  config.formatter     = 'documentation'

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end