require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get items_index_url
    assert_response :success
  end

  test "should get show" do
    get items_show_url
    assert_response :success
  end

  test "should get update" do
    get items_update_url
    assert_response :success
  end

  # test "the truth" do
  #   assert true
  # end

end
