# frozen_string_literal: true

require "decidim/dev"

require "simplecov"
SimpleCov.start "rails"
if ENV["CODECOV"]
  require "codecov"
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

ENV["ENGINE_ROOT"] = File.dirname(__dir__)

RSpec.configure do |config|
  config.before do
    Decidim::Verifications.register_workflow(:tos_verification) do |workflow|
      workflow.engine = Decidim::TosVerification::Verification::Engine
      workflow.admin_engine = Decidim::TosVerification::Verification::AdminEngine
    end
  end
end
