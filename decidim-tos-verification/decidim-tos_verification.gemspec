# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/tos_verification/version"

Gem::Specification.new do |s|
  s.version = Decidim::TosVerification.version
  s.authors = ["Vera Rojman"]
  s.email = ["vera@platoniq.net"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-tos_verification"
  s.required_ruby_version = ">= 2.7"

  s.name = "decidim-tos_verification"
  s.summary = "A decidim verification module to verify users when they agree to domain-specific Terms of Service"
  s.description = "."

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::TosVerification.version

  s.add_development_dependency "decidim-admin", Decidim::TosVerification.version
  s.add_development_dependency "decidim-dev", Decidim::TosVerification.version
end
