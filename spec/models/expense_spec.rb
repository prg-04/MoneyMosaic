# spec/models/expense_spec.rb
require 'rails_helper'

RSpec.describe Expense, type: :model do
  it 'should not save expense without name' do
    expense = Expense.new
    expect(expense.save).to be_falsey
    expect(expense.errors[:name]).to include("can't be blank")
  end

  it 'should not save expense without amount' do
    expense = Expense.new(name: 'Test Expense')
    expect(expense.save).to be_falsey
    expect(expense.errors[:amount]).to include("can't be blank")
  end
end
