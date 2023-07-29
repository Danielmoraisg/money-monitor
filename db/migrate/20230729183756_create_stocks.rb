# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.datetime :happened_at
      t.float :total_value
      t.float :quantity

      t.timestamps
    end
  end
end
