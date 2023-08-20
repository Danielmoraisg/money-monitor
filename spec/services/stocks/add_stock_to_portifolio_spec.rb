# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stocks::AddStockToPortifolio do
  subject(:add_stock_to_portifolio) { described_class.call(user_id:, stock_id:) }

  let(:stock_id) { create(:stock).id }
  let(:user) { create(:user) }
  let(:user_id) { user.id }

  context 'when succeding' do
    it 'succeeds' do
      expect(add_stock_to_portifolio).to be_success
      expect(User.find(user_id).portfolio).to eq [stock_id]
    end

    context 'when user already has stocks' do
      let!(:existing_stock_id) { create(:stock, :from_user, user:).id }

      it 'appends the value to the end of the array' do
        expect(add_stock_to_portifolio).to be_success
        expect(User.find(user_id).portfolio).to eq [existing_stock_id, stock_id]
      end
    end
  end
end
