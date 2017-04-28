require 'test_helper'

class BootstrapExamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bootstrap_examples_index_url
    assert_response :success
  end

end
