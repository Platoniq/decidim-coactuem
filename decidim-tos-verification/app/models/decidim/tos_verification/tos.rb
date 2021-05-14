# frozen_string_literal: true

module Decidim
  module TosVerification
    class Tos < ApplicationRecord
      include Decidim::TranslatableResource

      self.table_name = :decidim_tos_verification_tos

      belongs_to :organization, foreign_key: "decidim_organization_id", class_name: "Decidim::Organization"

      validates :organization, presence: true

      translatable_fields :title, :body
    end
  end
end
