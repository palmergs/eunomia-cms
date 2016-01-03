require 'test_helper'

#class Api::V1::StructureItemsControllerTest < ActionDispatch::IntegrationTest
class Api::V1::StructureItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:structure_items)
  end
end
