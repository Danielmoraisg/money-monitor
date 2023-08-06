# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteStock do
  subject(:delete_stock) { described_class.call(id:) }

  context 'when stock exists' do
    let(:id) { create(:stock).id }

    before do
      delete_stock
    end

    it 'deletes the stock' do
      expect(Stock.find_by_id(id)).to be_nil
    end
  end
  context 'when stock does not exist' do
    let(:id) { 1_134 }
    it 'does not raises error' do
      expect(delete_stock).to be_success
    end
  end
end
