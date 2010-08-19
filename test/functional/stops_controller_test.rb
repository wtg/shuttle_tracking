require 'test_helper'

class StopsControllerTest < ActionController::TestCase
  setup do
    @stop = stops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stop" do
    assert_difference('Stop.count') do
      post :create, :stop => @stop.attributes
    end

    assert_redirected_to stop_path(assigns(:stop))
  end

  test "should show stop" do
    get :show, :id => @stop.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stop.to_param
    assert_response :success
  end

  test "should update stop" do
    put :update, :id => @stop.to_param, :stop => @stop.attributes
    assert_redirected_to stop_path(assigns(:stop))
  end

  test "should destroy stop" do
    assert_difference('Stop.count', -1) do
      delete :destroy, :id => @stop.to_param
    end

    assert_redirected_to stops_path
  end
end
