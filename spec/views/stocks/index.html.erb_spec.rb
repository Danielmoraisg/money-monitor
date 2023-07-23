# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stocks/index', type: :view do
  before(:each) do
    assign(:stocks, [
             Stock.create!(
               name: 'Name',
               price: 2
             ),
             Stock.create!(
               name: 'Name',
               price: 2
             )
           ])
  end

  it 'renders a list of stocks' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
