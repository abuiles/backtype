$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |s|
  s.name              = "backtype"
  s.version           = "1.0"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = ""
  s.homepage          = "http://github.com/abuiles/backtype"
  s.email             = "builes.adolfo@googlemail.com"
  s.authors           = [ "Adolfo Builes" ]
  s.has_rdoc          = false

  s.files             = %w( README.markdown Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")

  s.add_development_dependency "rspec"
end
