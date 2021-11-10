# frozen_string_literal: true

module NeedsParticipatorySpaceVerification
  extend ActiveSupport::Concern

  included do
    def authorize_participatory_space
      enforce_permission_to :read, :participatory_space, current_participatory_space: current_participatory_space
      restricted_participatory_space?
    end

    private

    def restricted_participatory_space?
      restricted = Rails.application.secrets.restricted_participatory_spaces
      return unless restricted && current_participatory_space

      _name, spaces = restricted.find { |element| element[0] == current_participatory_space.manifest.name }
      return unless spaces

      space, methods = spaces.find { |item| item[0].to_s == current_participatory_space.slug.to_s }
      return unless space && methods

      redirect_to_first_authorization(methods)
    end

    def redirect_to_first_authorization(methods)
      return if current_user && Decidim::Verifications::Authorizations.new(organization: current_organization, user: current_user, name: methods).any?

      path = Decidim::Verifications::Adapter.from_element(methods.first).root_path(redirect_url: Decidim::ResourceLocatorPresenter.new(current_participatory_space)&.path)
      redirect_to(path) || "/"
    end
  end
end
