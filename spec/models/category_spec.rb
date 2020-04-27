require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.new name: 'Horror', priority: 1 }
  describe 'validates category attributes' do
    it 'validates if the category is valid' do
      expect(category.valid?).to eql(true)
    end
    it 'validates if the category name is present' do
      category.name = ' '
      expect(category.valid?).not_to eql(true)
    end
    it 'validates if the priority is present' do
      category.priority = nil
      expect(category.valid?).not_to eql(true)
    end
  end
end
