$LOAD_PATH.unshift 'lib'

Gem::Specification.new do |spec|
  spec.authors  = [ "Adolfo Builes" ]
  spec.date     = Time.now.strftime('%Y-%m-%d')
  spec.email    = "builes.adolfo@googlemail.com"
  spec.has_rdoc = false
  spec.homepage = "http://github.com/abuiles/backtype"
  spec.name     = "backtype"
  spec.summary  = "Ruby gem wrapper for backtype's API."
  spec.version  = "1.0"

  spec.files     = %w( README.markdown Rakefile LICENSE )
  spec.files    += Dir.glob("lib/**/*")

  spec.add_development_dependency "rspec"
  spec.add_development_dependency("vcr", ">= 1.5.1")
  spec.add_dependency("httparty", ">= 0.7.3")

  spec.description  = <<desc
    require 'backtype'

    backtype = Backtype::Base.new(:api_key => 'your_api_key')
    backtype.comments_by_page :url => 'http://www.reddit.com/r/science/comments/8zf9d/holy_crap_i_never_realized_i_was_peeling_a_banana/'
desc
end
