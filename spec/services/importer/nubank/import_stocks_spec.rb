# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Importer::Nubank::ImportStocks do
  subject(:import_negociations) { described_class.call(file_path:) }
  context 'with valid csv' do
    context 'when csv has data'
    let(:file_path) { Rails.root.join('spec', 'fixtures', 'importer', 'nubank', 'negotiations.csv') }
    it 'imports data from a CSV file' do
      expect { import_negociations }.to change(Stock, :count).by(2)
    end

    context 'when csv is empty'
    let(:file_path) { Rails.root.join('spec', 'fixtures', 'importer', 'nubank', 'empty.csv') }
    it 'handles empty CSV file' do
      expect { import_negociations }.not_to change(Stock, :count)
    end
  end
  context 'with invalid csv'
  let(:file_path) { Rails.root.join('spec', 'fixtures', 'importer', 'nubank', 'invalid.csv') }
  it 'handles invalid data in csv' do
    expect { import_negotiations }.not_to raise_error
    expect(import_negotiations).to be_failure
  end
end
