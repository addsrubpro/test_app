require 'test_helper'

class ClearingoutsControllerTest < ActionController::TestCase
  setup do
    @clearingout = clearingouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clearingouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clearingout" do
    assert_difference('Clearingout.count') do
      post :create, :clearingout => @clearingout.attributes
    end

    assert_redirected_to clearingout_path(assigns(:clearingout))
  end

  test "should show clearingout" do
    get :show, :id => @clearingout.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @clearingout.to_param
    assert_response :success
  end

  test "should update clearingout" do
    put :update, :id => @clearingout.to_param, :clearingout => @clearingout.attributes
    assert_redirected_to clearingout_path(assigns(:clearingout))
  end

  test "should destroy clearingout" do
    assert_difference('Clearingout.count', -1) do
      delete :destroy, :id => @clearingout.to_param
    end

    assert_redirected_to clearingouts_path
  end
end
