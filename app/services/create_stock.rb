# frozen_string_literal: true

class CreateStock
  prepend SimpleCommand

  def initialize(stock_attributes:)
    @stock_attributes = stock_attributes
  end

  def call
    Stock.create! @stock_attributes
  end
end
