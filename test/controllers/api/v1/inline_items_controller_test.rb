require 'test_helper'

#class Api::V1::InlineItemsControllerTest < ActionDispatch::IntegrationTest
class Api::V1::InlineItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inline_items)
  end
end
