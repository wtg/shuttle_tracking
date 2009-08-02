require 'test_helper'

class ShuttlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shuttles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shuttle" do
    assert_difference('Shuttle.count') do
      post :create, :shuttle => { }
    end

    assert_redirected_to shuttle_path(assigns(:shuttle))
  end

  test "should show shuttle" do
    get :show, :id => shuttles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shuttles(:one).to_param
    assert_response :success
  end

  test "should update shuttle" do
    put :update, :id => shuttles(:one).to_param, :shuttle => { }
    assert_redirected_to shuttle_path(assigns(:shuttle))
  end

  test "should destroy shuttle" do
    assert_difference('Shuttle.count', -1) do
      delete :destroy, :id => shuttles(:one).to_param
    end

    assert_redirected_to shuttles_path
  end
end
