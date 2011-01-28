$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec'
require 'backtype'
require 'vcr'

VCR.config do |c|
  c.cassette_library_dir     = 'spec/fixtures/cassette_library'
  c.stub_with                :fakeweb
  c.ignore_localhost         = true
  c.default_cassette_options = { :record => :none }
end

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end

