# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :tos, class: "Decidim::TosVerification::Tos" do
    organization { create :organization }
    title { Decidim::Faker::Localized.sentence }
    body { Decidim::Faker::Localized.sentence }
  end
end
