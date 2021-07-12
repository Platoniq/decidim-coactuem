# frozen_string_literal: true

require "spec_helper"

module Decidim::TosVerification
  describe Tos do
    subject { tos }

    let(:organization) { create(:organization) }
    let(:tos) { create(:tos, organization: organization, body: body, title: title) }

    let(:title) { Decidim::Faker::Localized.sentence }
    let(:body) { Decidim::Faker::Localized.sentence }

    it { is_expected.to be_valid }

    it "is associated with an organization" do
      expect(subject).to eq(tos)
      expect(subject.organization).to eq(organization)
    end

    it "has a title" do
      expect(subject.title).to eq(title)
    end

    it "has a body" do
      expect(subject.body).to eq(body)
    end

    describe "#validations" do
      context "without a title" do
        let(:title) { {} }

        it { is_expected.not_to be_valid }
      end

      context "without a body" do
        let(:body) { {} }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
