require 'test_helper'

class ActivatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get activates_create_url
    assert_response :success
  end

  test "should get edit" do
    get activates_edit_url
    assert_response :success
  end

  test "should get update" do
    get activates_update_url
    assert_response :success
  end

end
