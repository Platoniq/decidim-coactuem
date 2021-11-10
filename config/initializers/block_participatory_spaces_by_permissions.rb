# frozen_string_literal: true

Rails.application.config.to_prepare do
  # blocks some participatory_spaces according to permissions
  # Decidim::Permissions.include(Decidim::PermissionsOverride)
  Decidim::ParticipatorySpaceContext.include(NeedsParticipatorySpaceVerification)
end
