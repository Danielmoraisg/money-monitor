# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::DeleteUser do
  subject(:delete_user) { described_class.call(id:) }

  context 'when user exists' do
    let(:id) { create(:user).id }

    before do
      delete_user
    end

    it 'deletes the user' do
      expect(User.find_by_id(id)).to be_nil
    end
  end
  context 'when user does not exist' do
    let(:id) { 1_134 }
    it 'does not raises error' do
      expect(delete_user).to be_success
    end
  end
end
