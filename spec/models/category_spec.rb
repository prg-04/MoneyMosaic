# spec/models/category_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'should not save category without name' do
    category = Category.new
    expect(category.save).to be_falsey
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'should not save category without icon' do
    category = Category.new(name: 'Test Category')
    expect(category.save).to be_falsey
    expect(category.errors[:icon]).to include("can't be blank")
  end
end
