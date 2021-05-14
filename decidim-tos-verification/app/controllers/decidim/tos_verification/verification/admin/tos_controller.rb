# frozen_string_literal: true

module Decidim
  module TosVerification
    module Verification
      module Admin
        class TosController < Decidim::Admin::ApplicationController
          include NeedsPermission

          helper_method :tos

          def edit
            enforce_permission_to :edit, :authorization

            @form = form(TosForm).from_model(tos)
          end

          def update
            enforce_permission_to :update, :authorization

            @form = form(TosForm).from_params(params)

            UpdateTos.call(@form, tos) do
              on(:ok) do
                flash[:notice] = I18n.t("tos.update.success", scope: "decidim.tos_verification.verification.admin")
                redirect_to root_path
              end

              on(:invalid) do
                flash.now[:alert] = I18n.t("tos.update.invalid", scope: "decidim.tos_verification.verification.admin")
                render action: "edit"
              end
            end
          end

          private

          def tos
            Decidim::TosVerification::Tos.find_or_create_by(organization: current_organization)
          end
        end
      end
    end
  end
end
