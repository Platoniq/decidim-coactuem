# frozen_string_literal: true

module Decidim
  module TosVerification
    module Verification
      # This is an engine that implements the interface for
      # user authorization by tos acceptance.
      class Engine < ::Rails::Engine
        isolate_namespace Decidim::TosVerification::Verification

        routes do
          resource :authorizations, only: [:new, :create], as: :authorization do
            get :renew, on: :collection
          end

          root to: "authorizations#new"
        end

        initializer "decidim_tos_verification.assets" do |app|
          app.config.assets.precompile += %w(decidim_tos_verification_manifest.css
                                             decidim/tos_verification/verification.scss)
        end

        def load_seed
          # Enable the `:tos_verification` authorization
          org = Decidim::Organization.first
          org.available_authorizations << :tos_verification
          org.save!
        end
      end
    end
  end
end
