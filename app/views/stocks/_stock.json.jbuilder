# frozen_string_literal: true

json.extract! stock, :id, :name, :price, :created_at, :updated_at
json.url stock_url(stock, format: :json)
