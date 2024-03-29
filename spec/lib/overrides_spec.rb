# frozen_string_literal: true

require "rails_helper"

# We make sure that the checksum of the file overriden is the same
# as the expected. If this test fails, it means that the overriden
# file should be updated to match any change/bug fix introduced in the core
checksums = [
  {
    package: "decidim-core",
    files: {
      # layouts
      "/app/views/layouts/decidim/_head_extra.html.erb" => "1b8237357754cf519f4e418135f78440",
      "/app/views/layouts/decidim/_organization_colors.html.erb" => "34f0d188a62108e7a57a1c270daed8bb",
      # permissions
      "/app/controllers/concerns/decidim/participatory_space_context.rb" => "4066e1806157f7d5d79aca636f0ade3a"
    }
  },
  {
    package: "decidim-admin",
    files: {
      # views
      "/app/views/decidim/admin/organization_appearance/form/_colors.html.erb" => "725fc77b4c80f885b7b4191a75a06949"
    }
  }
]

describe "Overriden files", type: :view do
  # rubocop:disable Rails/DynamicFindBy
  checksums.each do |item|
    spec = ::Gem::Specification.find_by_name(item[:package])

    item[:files].each do |file, signature|
      it "#{spec.gem_dir}#{file} matches checksum" do
        expect(md5("#{spec.gem_dir}#{file}")).to eq(signature)
      end
    end
  end
  # rubocop:enable Rails/DynamicFindBy

  private

  def md5(file)
    Digest::MD5.hexdigest(File.read(file))
  end
end
