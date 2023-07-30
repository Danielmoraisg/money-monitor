# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchStockByAttribute do
  subject(:search_stock) { described_class.call(attribute:, value:) }

  let(:attribute) { 'name' }
  let(:value) { 'test_stock' }

  context 'when stock exists' do
    before do
      create(:stock, name: value)
    end
    it 'finds and returns the record' do
      expect(search_stock).to be_success
      expect(search_stock.result).to be_a(Stock)
    end
  end
  context 'when stock does not exist' do
    it { is_expected.to be_failure }
  end
end
