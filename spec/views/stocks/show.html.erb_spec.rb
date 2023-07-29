# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stocks/show', type: :view do
  before(:each) do
    assign(:stock, Stock.create!(
                     id: '',
                     name: 'Name',
                     ticker: 'Ticker',
                     total_value: 2.5,
                     quantity: 3.5
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Ticker/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
