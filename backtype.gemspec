$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |spec|
  spec.authors     = [ "Adolfo Builes" ]
  spec.date        = Time.now.strftime('%Y-%m-%d')
  spec.description = "Ruby gem wrapper for backtype's API."
  spec.email       = "builes.adolfo@googlemail.com"
  spec.has_rdoc    = false
  spec.homepage    = "http://github.com/abuiles/backtype"
  spec.name        = "backtype"
  spec.summary     = %q{See example: https://github.com/abuiles/backtype/blob/master/README.markdown}
  spec.version     = "0.0.1.2"

  spec.files  = %w( README.markdown Rakefile LICENSE )
  spec.files += Dir.glob("lib/**/*")

  spec.add_development_dependency "rspec"
  spec.add_development_dependency("vcr", ">= 1.5.1")
  spec.add_dependency("httparty", ">= 0.7.3")
end
