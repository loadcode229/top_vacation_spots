require_relative 'lib/top_vacation_spots/version'

Gem::Specification.new do |spec|
  spec.name          = "top_vacation_spots"
  spec.version       = TopVacationSpots::VERSION
  spec.authors       = ["loadcode229"]
  spec.email         = ["sepone229@gmail.com"]

  spec.summary       = %q{Top Vacation Spots in the world.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "http://rubygems.org/gems/top-travel-destination-cli-gem"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  #spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  #The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
