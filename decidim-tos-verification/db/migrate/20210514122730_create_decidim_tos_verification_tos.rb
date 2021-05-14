# frozen_string_literal: true

class CreateDecidimTosVerificationTos < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_tos_verification_tos do |t|
      t.references :decidim_organization, foreign_key: { to_table: :decidim_organizations }, index: { name: "index_decidim_tos_verifications_tos_on_organization" }
      t.jsonb :title
      t.jsonb :body

      t.timestamps
    end
  end
end
