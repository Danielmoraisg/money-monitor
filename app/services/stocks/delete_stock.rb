# frozen_string_literal: true

module Stocks
  class DeleteStock
    prepend SimpleCommand

    def initialize(id:)
      @id = id
    end

    def call
      stock = Stock.find_by_id(@id)
      return unless stock

      stock.destroy
    end
  end
end
