require 'test_helper'

#class Api::V1::ContentItemsControllerTest < ActionDispatch::IntegrationTest
class Api::V1::ContentItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_items)
  end

  test "should create article" do
    assert_difference('ContentItem.count') do
      post :create, params: {
        content_item: {
          structure_item_id: 1,
          content: 'Some title'
        }
      }
    end
  end
end
