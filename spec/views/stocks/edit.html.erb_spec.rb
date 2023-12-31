# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stocks/edit', type: :view do
  let(:stock) do
    Stock.create!(
      id: '',
      name: 'MyString',
      ticker: 'MyString',
      total_value: 1.5,
      quantity: 1.5
    )
  end

  before(:each) do
    assign(:stock, stock)
  end

  it 'renders the edit stock form' do
    render

    assert_select 'form[action=?][method=?]', stock_path(stock), 'post' do
      assert_select 'input[name=?]', 'stock[id]'

      assert_select 'input[name=?]', 'stock[name]'

      assert_select 'input[name=?]', 'stock[ticker]'

      assert_select 'input[name=?]', 'stock[total_value]'

      assert_select 'input[name=?]', 'stock[quantity]'
    end
  end
end
