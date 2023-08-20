# frozen_string_literal: true

module Stocks
  class AddStockToPortifolio
    prepend SimpleCommand

    def initialize(user_id:, stock_id:)
      @user_id = user_id
      @stock_id = stock_id
    end

    def call
      portfolio = User.find(@user_id).portfolio << @stock_id
      User.update(@user_id, portfolio:)
    end
  end
end
