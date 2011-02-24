require 'test_helper'

class EmoneyoutstandingsControllerTest < ActionController::TestCase
  setup do
    @emoneyoutstanding = emoneyoutstandings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emoneyoutstandings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emoneyoutstanding" do
    assert_difference('Emoneyoutstanding.count') do
      post :create, :emoneyoutstanding => @emoneyoutstanding.attributes
    end

    assert_redirected_to emoneyoutstanding_path(assigns(:emoneyoutstanding))
  end

  test "should show emoneyoutstanding" do
    get :show, :id => @emoneyoutstanding.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @emoneyoutstanding.to_param
    assert_response :success
  end

  test "should update emoneyoutstanding" do
    put :update, :id => @emoneyoutstanding.to_param, :emoneyoutstanding => @emoneyoutstanding.attributes
    assert_redirected_to emoneyoutstanding_path(assigns(:emoneyoutstanding))
  end

  test "should destroy emoneyoutstanding" do
    assert_difference('Emoneyoutstanding.count', -1) do
      delete :destroy, :id => @emoneyoutstanding.to_param
    end

    assert_redirected_to emoneyoutstandings_path
  end
end
