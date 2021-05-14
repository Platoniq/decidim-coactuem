# frozen_string_literal: true

module Decidim
  module TosVerification
    module Verification
      # This is an engine that implements the administration interface for
      # user authorization by Terms of Service acceptance.
      class AdminEngine < ::Rails::Engine
        isolate_namespace Decidim::TosVerification::Verification::Admin

        paths["db/migrate"] = nil
        paths["lib/tasks"] = nil

        routes do
          resource :tos, only: [:edit, :update]

          root to: "tos#edit"
        end
      end
    end
  end
end
