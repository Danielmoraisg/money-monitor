# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchStockByName do
  subject(:search_stock) { described_class.call(name:) }

  let(:name) { 'test_stock' }

  context 'when stock exists' do
    before do
      create(:stock, name:)
    end
    it { is_expected.to be_success }
  end
  context 'when stock does not exist' do
    it { is_expected.to be_failure }
  end
end
