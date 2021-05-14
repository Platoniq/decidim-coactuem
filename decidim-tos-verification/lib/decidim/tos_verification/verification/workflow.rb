# frozen_string_literal: true

Decidim::Verifications.register_workflow(:tos_verification) do |workflow|
  workflow.engine = Decidim::TosVerification::Verification::Engine
  workflow.admin_engine = Decidim::TosVerification::Verification::AdminEngine

  workflow.options do |options|
    options.attribute :acceptance, type: :boolean, required: true
  end
end
