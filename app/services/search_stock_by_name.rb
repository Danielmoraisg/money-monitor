# frozen_string_literal: true

class SearchStockByName
  prepend SimpleCommand

  def initialize(name:)
    @name = name
  end

  def call
    stock = Stock.find_by(name: @name)
    errors.add(:base, "Could not find stock with name #{@name}") unless stock
  end
end
