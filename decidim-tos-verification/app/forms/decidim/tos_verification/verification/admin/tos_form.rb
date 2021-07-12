# frozen_string_literal: true

require "securerandom"

module Decidim
  module TosVerification
    module Verification
      module Admin
        # A form object to be used when admins want to upload the Terms of Service for the verification
        class TosForm < Form
          include TranslatableAttributes
          include TranslationsHelper

          translatable_attribute :title, String
          translatable_attribute :body, String

          validates :title, :body, translatable_presence: true

          alias organization current_organization
        end
      end
    end
  end
end
