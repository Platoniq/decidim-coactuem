# frozen_string_literal: true

module Decidim
  module TosVerification
    module Verification
      class AuthorizationsController < Decidim::ApplicationController
        include Decidim::Verifications::Renewable

        helper_method :authorization, :tos

        before_action :authorization

        def new
          enforce_permission_to :create, :authorization, authorization: authorization

          @form = AuthorizationForm.new(handler_handle: "tos_verification").with_context(current_organization: current_organization)
        end

        def create
          enforce_permission_to :create, :authorization, authorization: authorization

          @form = AuthorizationForm.from_params(
            params.merge(user: current_user)
          ).with_context(current_organization: current_organization)

          Decidim::Verifications::ConfirmUserAuthorization.call(authorization, @form, session) do
            on(:ok) do
              flash[:notice] = t("authorizations.create.success", scope: "decidim.tos_verification.verification")
              redirect_to decidim_verifications.authorizations_path
            end

            on(:invalid) do
              flash.now[:alert] = t("authorizations.create.error", scope: "decidim.tos_verification.verification")
              render :new
            end
          end
        end

        private

        def authorization
          @authorization ||= Decidim::Authorization.find_or_initialize_by(
            user: current_user,
            name: "tos_verification"
          )
        end

        def tos
          Decidim::TosVerification::Tos.find_by(organization: current_organization)
        end
      end
    end
  end
end
