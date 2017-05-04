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
end
