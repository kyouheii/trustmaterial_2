require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoices_index_url
    assert_response :success
  end

  test "should get show" do
    get invoices_show_url
    assert_response :success
  end

  test "should get new" do
    get invoices_new_url
    assert_response :success
  end

  test "should get edit" do
    get invoices_edit_url
    assert_response :success
  end

end
