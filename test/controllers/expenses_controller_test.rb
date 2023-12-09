# Append to /home/evans/Documents/MoneyMosaic/test/controllers/expenses_controller_test.rb

test "should get new" do
  get new_expense_url
  assert_response :success
end

test "should create expense" do
  assert_difference('Expense.count') do
    post expenses_url, params: { expense: { name: 'Test Expense', amount: 100 } }
  end

  assert_redirected_to expense_url(Expense.last)
  assert_equal 'Expense created successfully', flash[:notice]
end

test "should not create expense for other user's category" do
  assert_no_difference('Expense.count') do
    post expenses_url, params: { expense: { name: 'Test Expense', amount: 100 } }
  end

  assert_redirected_to categories_path
  assert_equal 'You can only create expenses from your categories', flash[:notice]
end

test "should not create expense with invalid params" do
  assert_no_difference('Expense.count') do
    post expenses_url, params: { expense: { name: '', amount: '' } }
  end

  assert_response :unprocessable_entity
  assert_not_nil flash[:alert]
end

test "should update category sum spent after creating expense" do
  post expenses_url, params: { expense: { name: 'Test Expense', amount: 100 } }
  category = Category.find(params[:category_id])
  assert_equal 100, category.sum_spent
endrequire "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
