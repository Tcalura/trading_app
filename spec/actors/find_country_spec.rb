# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe FindCountry, type: :actor do
  describe '.call' do
    let(:country) { create(:country) }

    subject(:search) do
      described_class.result(country_id: country.id)
    end

    context 'with valid arguments' do
      it 'searchs country with valid id' do
        expect(search).to be_success
      end
    end

    context 'without valid arguments' do
      it 'searchs country with invalid id' do
        result = described_class.result(country_id: 9999)
        expect(result).to be_failure
      end
    end
  end
end
