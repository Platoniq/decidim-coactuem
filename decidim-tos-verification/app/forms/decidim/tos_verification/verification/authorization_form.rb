# frozen_string_literal: true

require "securerandom"

module Decidim
  module TosVerification
    module Verification
      # A form object for users to enter their access code to get verified.
      class AuthorizationForm < AuthorizationHandler
        attribute :acceptance, Boolean
        attribute :handler_handle, String

        validates :acceptance, allow_nil: false, acceptance: true

        validates :handler_handle,
                  presence: true,
                  inclusion: {
                    in: proc { |form|
                      form.current_organization.available_authorizations
                    }
                  }

        def handler_name
          handler_handle
        end

        delegate :title, :body, to: :tos

        private

        def tos
          Decidim::TosVerification::Tos.find_by(organization: current_organization)
        end
      end
    end
  end
end
