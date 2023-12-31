# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stocks/index', type: :view do
  before(:each) do
    assign(:stocks, [
             Stock.create!(
               id: '',
               name: 'Name',
               ticker: 'Ticker',
               total_value: 2.5,
               quantity: 3.5
             ),
             Stock.create!(
               id: '',
               name: 'Name',
               ticker: 'Ticker',
               total_value: 2.5,
               quantity: 3.5
             )
           ])
  end

  it 'renders a list of stocks', skip: true do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Ticker'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.5.to_s), count: 2
  end
end
