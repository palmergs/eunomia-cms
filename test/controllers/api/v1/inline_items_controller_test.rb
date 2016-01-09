require 'test_helper'

#class Api::V1::InlineItemsControllerTest < ActionDispatch::IntegrationTest
class Api::V1::InlineItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inline_items)
  end

  test "should return inline item" do
    get :show, params: { id: 1 }
    assert_response :success
    assert_not_nil assigns(:inline_item)
  end
end
