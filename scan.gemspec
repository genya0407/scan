require_relative 'lib/scan/version'

Gem::Specification.new do |spec|
  spec.name          = "scan"
  spec.version       = Scan::VERSION
  spec.authors       = ["genya0407"]
  spec.email         = ["longinus.eva@gmail.com"]

  spec.summary       = %q{Read from stdin, scan it by pattern, write to stdout}
  spec.description   = %q{Read from stdin, scan it by pattern, write to stdout}
  spec.homepage      = "https://github.com/genya0407/scan"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/genya0407/scan"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
