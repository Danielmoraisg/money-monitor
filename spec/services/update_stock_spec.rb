# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateStock do
  subject(:update_stock) { described_class.call(id:, stock_attribute:, new_value:) }

  let(:name) { 'test_stock' }
  let(:stock_attribute) { 'name' }
  let(:new_value) { 'new stock name' }

  context 'when stock exists' do
    let(:id) { 42 }
    before do
      create(:stock, :with_specific_id, name:)
    end

    it 'updates the value' do
      expect { update_stock }
        .to change { Stock.find(id).name }
        .from(name).to(new_value)
      expect(update_stock).to be_success
    end
  end
  context 'when stock does not exist' do
    let(:id) { 1_134 }
    it 'raises record not found error' do
      expect { update_stock }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
