# frozen_string_literal: true

require_relative "lib/ftf/version"

Gem::Specification.new do |spec|
  spec.name = "ftf"
  spec.version = FTF::VERSION
  spec.authors = ["Aitor García Rey"]
  spec.email = ["aitor@devengo.com"]

  spec.summary = "A ruby gem to generate FTF files for SEPBLAC"
  spec.description = "Generate SEPBLAC FTF valid files from a json"
  spec.homepage = "https://github.com/devengoapp/ftf"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/devengoapp/ftf"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "fiddle", "~> 1.1"
  spec.add_dependency "rdoc", "~> 6.11"
  spec.add_dependency "zeitwerk", ">= 2.6.0", "< 2.7.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
