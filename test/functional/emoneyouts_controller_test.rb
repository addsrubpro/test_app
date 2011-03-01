require 'test_helper'

class EmoneyoutsControllerTest < ActionController::TestCase
  setup do
    @emoneyout = emoneyouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emoneyouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emoneyout" do
    assert_difference('Emoneyout.count') do
      post :create, :emoneyout => @emoneyout.attributes
    end

    assert_redirected_to emoneyout_path(assigns(:emoneyout))
  end

  test "should show emoneyout" do
    get :show, :id => @emoneyout.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @emoneyout.to_param
    assert_response :success
  end

  test "should update emoneyout" do
    put :update, :id => @emoneyout.to_param, :emoneyout => @emoneyout.attributes
    assert_redirected_to emoneyout_path(assigns(:emoneyout))
  end

  test "should destroy emoneyout" do
    assert_difference('Emoneyout.count', -1) do
      delete :destroy, :id => @emoneyout.to_param
    end

    assert_redirected_to emoneyouts_path
  end
end
