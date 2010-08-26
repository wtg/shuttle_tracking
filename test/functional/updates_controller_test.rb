require 'test_helper'

class UpdatesControllerTest < ActionController::TestCase
  setup do
    @update = updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create update" do
    assert_difference('Update.count') do
      post :create, :update => @update.attributes
    end

    assert_redirected_to update_path(assigns(:update))
  end

  test "should show update" do
    get :show, :id => @update.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @update.to_param
    assert_response :success
  end

  test "should update update" do
    put :update, :id => @update.to_param, :update => @update.attributes
    assert_redirected_to update_path(assigns(:update))
  end

  test "should destroy update" do
    assert_difference('Update.count', -1) do
      delete :destroy, :id => @update.to_param
    end

    assert_redirected_to updates_path
  end
end
