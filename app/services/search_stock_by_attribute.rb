# frozen_string_literal: true

class SearchStockByAttribute
  prepend SimpleCommand

  def initialize(attribute:, value:)
    @attribute = attribute
    @value = value
  end

  def call
    stock = Stock.find_by(@attribute => @value)
    errors.add(:base, "Could not find stock with attribute #{@value}") unless stock

    stock
  end
end
