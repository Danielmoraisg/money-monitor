# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::UpdateUser do
  subject(:update_user) { described_class.call(id:, user_attribute:, new_value:) }

  let(:name) { 'test_user' }
  let(:user_attribute) { 'name' }
  let(:new_value) { 'new user name' }

  context 'when user exists' do
    let(:user) { create(:user, name:) }
    let(:id) { user.id }

    it 'updates the value' do
      expect { update_user }
        .to change { User.find(id).name }
        .from(name).to(new_value)
      expect(update_user).to be_success
    end
  end
  context 'when user does not exist' do
    let(:id) { 1_134 }
    it 'raises record not found error' do
      expect { update_user }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
