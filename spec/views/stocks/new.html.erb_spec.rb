# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stocks/new', type: :view do
  before(:each) do
    assign(:stock, Stock.new(
                     id: '',
                     name: 'MyString',
                     ticker: 'MyString',
                     total_value: 1.5,
                     quantity: 1.5
                   ))
  end

  it 'renders new stock form' do
    render

    assert_select 'form[action=?][method=?]', stocks_path, 'post' do
      assert_select 'input[name=?]', 'stock[id]'

      assert_select 'input[name=?]', 'stock[name]'

      assert_select 'input[name=?]', 'stock[ticker]'

      assert_select 'input[name=?]', 'stock[total_value]'

      assert_select 'input[name=?]', 'stock[quantity]'
    end
  end
end
