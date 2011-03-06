require 'test_helper'

class AccounttypesControllerTest < ActionController::TestCase
  setup do
    @accounttype = accounttypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounttypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounttype" do
    assert_difference('Accounttype.count') do
      post :create, :accounttype => @accounttype.attributes
    end

    assert_redirected_to accounttype_path(assigns(:accounttype))
  end

  test "should show accounttype" do
    get :show, :id => @accounttype.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accounttype.to_param
    assert_response :success
  end

  test "should update accounttype" do
    put :update, :id => @accounttype.to_param, :accounttype => @accounttype.attributes
    assert_redirected_to accounttype_path(assigns(:accounttype))
  end

  test "should destroy accounttype" do
    assert_difference('Accounttype.count', -1) do
      delete :destroy, :id => @accounttype.to_param
    end

    assert_redirected_to accounttypes_path
  end
end
