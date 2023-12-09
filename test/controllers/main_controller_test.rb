require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index if user is signed in" do
  sign_in users(:one) # Assuming you have a fixture for users
  get :index
  assert_response :success
end

test "should redirect to splash_path if user is not signed in" do
  get :index
  assert_redirected_to splash_path
end
end
