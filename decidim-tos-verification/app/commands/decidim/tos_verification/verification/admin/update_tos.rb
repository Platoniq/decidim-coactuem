# frozen_string_literal: true

module Decidim
  module TosVerification
    module Verification
      module Admin
        # This command is executed when the admin updates the Terms of Service
        class UpdateTos < Rectify::Command
          # Initializes a UpdateTos Command.
          #
          # form - The form from which to get the data.
          # tos - The current instance to be updated.
          def initialize(form, tos)
            @form = form
            @tos = tos
          end

          # Updates the tos if valid.
          #
          # Broadcasts :ok if successful, :invalid otherwise.
          def call
            return broadcast(:invalid) if form.invalid?

            transaction do
              update_tos!
            end

            broadcast(:ok, tos)
          end

          private

          attr_reader :form, :tos

          def update_tos!
            tos.update!(
              title: form.title,
              body: form.body
            )
          end
        end
      end
    end
  end
end
