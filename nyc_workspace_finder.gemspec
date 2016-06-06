# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nyc_workspace_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "nyc_workspace_finder"
  spec.version       = NycWorkspaceFinder::VERSION
  spec.authors       = ["jwolfe890"]
  spec.email         = ["jwolfe890@gmail.com"]

  spec.summary       = %q{TODO: PROVIDES UP-TO-DATE PRICING INFO ON UNIQUE, ART OR PUNK-ORIENTED WORKSPACES IN NEW YORK CITY!.}
  spec.description   = %q{TODO: PROVIDES UP-TO-DATE PRICING INFO ON UNIQUE, ART OR PUNK-ORIENTED WORKSPACES IN NEW YORK CITY!}
  spec.homepage      = "TODO: https://github.com/jwolfe890/nyc_workspace_finder"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry"
end
