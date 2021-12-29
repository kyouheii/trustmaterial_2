require 'test_helper'

class QuotationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quotations_index_url
    assert_response :success
  end

  test "should get show" do
    get quotations_show_url
    assert_response :success
  end

  test "should get new" do
    get quotations_new_url
    assert_response :success
  end

  test "should get edit" do
    get quotations_edit_url
    assert_response :success
  end

end
