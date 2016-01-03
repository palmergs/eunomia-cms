require 'test_helper'

#class Api::V1::ContentItemsControllerTest < ActionDispatch::IntegrationTest
class Api::V1::ContentItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_items)
  end
end
