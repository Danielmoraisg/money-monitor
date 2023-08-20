# frozen_string_literal: true

module Importer
  module Nubank
    class ImportStocks
      prepend SimpleCommand

      def initialize(file_path:)
        @file_path = file_path
      end

      def call
        CSV.foreach(@file_path, headers: true, col_sep: ';', quote_char: '"') do |row|
          Stocks::CreateStock.call(stock_attributes: stock_attributes(row:))
        end
      end

      private

      def stock_attributes(row:)
        {
          happened_at: row['Dt. Negociação'],
          ticker: row['Ativo'],
          total_value: (convert_to_float(row['Financeiro Compra']) - convert_to_float(row['Financeiro Venda'])).abs,
          quantity: (convert_to_float(row['Quantidade Compra']) - convert_to_float(row['Quantidade Venda'])).abs
        }
      end

      def convert_to_float(value:)
        value.gsub(',', '.').to_f
      end
    end
  end
end
