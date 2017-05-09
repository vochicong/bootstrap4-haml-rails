require 'test_helper'

class BootstrapExamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end
  test "should get /navbar" do
    get navbar_path
    assert_response :success
  end
  test "should get /btn" do
    get btn_path
    assert_response :success
  end
  test "should get /grid" do
    get grid_path
    assert_response :success
  end
  test "should get /table" do
    get table_path
    assert_response :success
  end
end
