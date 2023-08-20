# frozen_string_literal: true

module Stocks
  class UpdateStock
    prepend SimpleCommand

    def initialize(id:, stock_attribute:, new_value:)
      @id = id
      @stock_attribute = stock_attribute
      @new_value = new_value
    end

    def call
      Stock.update(@id, @stock_attribute => @new_value)
    end
  end
end
