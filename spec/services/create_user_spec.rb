# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateUser do
  subject(:create_user) { described_class.call(user_attributes:) }

  let(:user_attributes) do
    {
      name: 'test_user',
      email: 'test.user@mail.com'
    }
  end
  context 'when succeding' do
    it 'succeeds' do
      expect(create_user).to be_success
      expect(User.find_by(email: 'test.user@mail.com')).to have_attributes(user_attributes)
    end
  end
end
