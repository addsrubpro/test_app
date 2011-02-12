require 'test_helper'

class UseraccountsControllerTest < ActionController::TestCase
  setup do
    @useraccount = useraccounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:useraccounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create useraccount" do
    assert_difference('Useraccount.count') do
      post :create, :useraccount => @useraccount.attributes
    end

    assert_redirected_to useraccount_path(assigns(:useraccount))
  end

  test "should show useraccount" do
    get :show, :id => @useraccount.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @useraccount.to_param
    assert_response :success
  end

  test "should update useraccount" do
    put :update, :id => @useraccount.to_param, :useraccount => @useraccount.attributes
    assert_redirected_to useraccount_path(assigns(:useraccount))
  end

  test "should destroy useraccount" do
    assert_difference('Useraccount.count', -1) do
      delete :destroy, :id => @useraccount.to_param
    end

    assert_redirected_to useraccounts_path
  end
end
