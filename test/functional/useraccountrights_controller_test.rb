require 'test_helper'

class UseraccountrightsControllerTest < ActionController::TestCase
  setup do
    @useraccountright = useraccountrights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:useraccountrights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create useraccountright" do
    assert_difference('Useraccountright.count') do
      post :create, :useraccountright => @useraccountright.attributes
    end

    assert_redirected_to useraccountright_path(assigns(:useraccountright))
  end

  test "should show useraccountright" do
    get :show, :id => @useraccountright.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @useraccountright.to_param
    assert_response :success
  end

  test "should update useraccountright" do
    put :update, :id => @useraccountright.to_param, :useraccountright => @useraccountright.attributes
    assert_redirected_to useraccountright_path(assigns(:useraccountright))
  end

  test "should destroy useraccountright" do
    assert_difference('Useraccountright.count', -1) do
      delete :destroy, :id => @useraccountright.to_param
    end

    assert_redirected_to useraccountrights_path
  end
end
