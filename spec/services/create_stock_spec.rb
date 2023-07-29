# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateStock do
  subject(:create_stock) { described_class.call(stock_attributes:) }

  let(:stock_attributes) do
    {
      name: 'test_stock',
      ticker: 'tst12',
      happened_at: '2023-07-29 19:53:22.513091000 +0000'.to_time,
      total_value: 1000.0,
      quantity: 10.0
    }
  end
  describe '.call' do
    it 'succeeds' do
      expect(create_stock).to be_success
      expect(Stock.find_by(name: 'test_stock')).to have_attributes(stock_attributes)
    end
  end
end
