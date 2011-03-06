require 'test_helper'

class RequeststatusesControllerTest < ActionController::TestCase
  setup do
    @requeststatus = requeststatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requeststatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requeststatus" do
    assert_difference('Requeststatus.count') do
      post :create, :requeststatus => @requeststatus.attributes
    end

    assert_redirected_to requeststatus_path(assigns(:requeststatus))
  end

  test "should show requeststatus" do
    get :show, :id => @requeststatus.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @requeststatus.to_param
    assert_response :success
  end

  test "should update requeststatus" do
    put :update, :id => @requeststatus.to_param, :requeststatus => @requeststatus.attributes
    assert_redirected_to requeststatus_path(assigns(:requeststatus))
  end

  test "should destroy requeststatus" do
    assert_difference('Requeststatus.count', -1) do
      delete :destroy, :id => @requeststatus.to_param
    end

    assert_redirected_to requeststatuses_path
  end
end
