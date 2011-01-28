$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |spec|
  spec.name              = "backtype"
  spec.version           = "1.0"
  spec.date              = Time.now.strftime('%Y-%m-%d')
  spec.summary           = ""
  spec.homepage          = "http://github.com/abuiles/backtype"
  spec.email             = "builes.adolfo@googlemail.com"
  spec.authors           = [ "Adolfo Builes" ]
  spec.has_rdoc          = false

  spec.files             = %w( README.markdown Rakefile LICENSE )
  spec.files            += Dir.glob("lib/**/*")

  spec.add_development_dependency "rspec"
  spec.add_development_dependency("vcr", '>= 1.5.1')
  spec.add_dependency('httparty', '>= 0.7.3')
end
