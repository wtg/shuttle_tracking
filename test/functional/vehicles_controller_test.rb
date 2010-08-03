require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, :vehicle => @vehicle.attributes
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, :id => @vehicle.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @vehicle.to_param
    assert_response :success
  end

  test "should update vehicle" do
    put :update, :id => @vehicle.to_param, :vehicle => @vehicle.attributes
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, :id => @vehicle.to_param
    end

    assert_redirected_to vehicles_path
  end
end
