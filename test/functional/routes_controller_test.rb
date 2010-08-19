require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post :create, :route => @route.attributes
    end

    assert_redirected_to route_path(assigns(:route))
  end

  test "should show route" do
    get :show, :id => @route.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @route.to_param
    assert_response :success
  end

  test "should update route" do
    put :update, :id => @route.to_param, :route => @route.attributes
    assert_redirected_to route_path(assigns(:route))
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete :destroy, :id => @route.to_param
    end

    assert_redirected_to routes_path
  end
end
