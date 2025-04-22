# frozen_string_literal: true
require_relative "lib/active_storage_download_logger/version"


Gem::Specification.new do |spec|
  spec.name          = "active_storage_download_logger"
  spec.version       = ActiveStorageDownloadLogger::VERSION
  spec.authors       = ["Shaik Tajuddinsha"]
  spec.email         = ["taj.shaik@cortexcraft.com"]

  spec.summary       = "Track and log ActiveStorage downloads with context in Rails apps"
  spec.description   = "A mountable Rails engine to log user, IP, file, and source information whenever an ActiveStorage file is downloaded."
  spec.license       = "MIT"

  # Public metadata for RubyGems or GitHub usage
  spec.homepage      = "https://github.com/tajccil/active_storage_download_logger"
  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = spec.homepage
  spec.metadata["changelog_uri"]    = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # If you're not ready to push to RubyGems, you can comment this:
  # spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.required_ruby_version = ">= 2.7"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.test_files = []

  spec.add_dependency "rails", ">= 6.0"

  # Optional if you're using auditing
  # spec.add_dependency "audited"

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "rake"
end
