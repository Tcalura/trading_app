# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'

RSpec.describe MatchDevices, type: :actor do
  subject(:match_devices) do
    described_class.result({
                            user: requester,
                            target_user: provider,
                            user_inventories: requester_payload,
                            target_inventories: provider_payload
                          })
  end

  let(:requester) { create(:requester) }
  let(:provider) { create(:provider) }

  let(:requester_payload) do
    requester.inventories.map do |inventory|
      { inventory: inventory, price: inventory&.device&.price, quantity: 2 }
    end
  end

  let(:provider_payload) do
    provider.inventories.map do |inventory|
      { inventory: inventory, price: inventory&.device&.price, quantity: 1 }
    end
  end

  describe '.call' do
    context 'when total match' do
      it 'success' do
        expect(match_devices).to be_success
        expect(requester.total_devices).to eq 4
        expect(provider.total_devices).to eq 6
      end
    end

    context 'when total does not match' do
      let(:provider_payload) do
        provider.inventories.map do |inventory|
          { inventory: inventory, price: inventory&.device&.price, quantity: 15 }
        end
      end

      it 'failure' do
        expect(match_devices).to be_failure
      end
    end
  end
end
