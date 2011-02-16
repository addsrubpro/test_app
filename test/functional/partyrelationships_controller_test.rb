require 'test_helper'

class PartyrelationshipsControllerTest < ActionController::TestCase
  setup do
    @partyrelationship = partyrelationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partyrelationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partyrelationship" do
    assert_difference('Partyrelationship.count') do
      post :create, :partyrelationship => @partyrelationship.attributes
    end

    assert_redirected_to partyrelationship_path(assigns(:partyrelationship))
  end

  test "should show partyrelationship" do
    get :show, :id => @partyrelationship.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @partyrelationship.to_param
    assert_response :success
  end

  test "should update partyrelationship" do
    put :update, :id => @partyrelationship.to_param, :partyrelationship => @partyrelationship.attributes
    assert_redirected_to partyrelationship_path(assigns(:partyrelationship))
  end

  test "should destroy partyrelationship" do
    assert_difference('Partyrelationship.count', -1) do
      delete :destroy, :id => @partyrelationship.to_param
    end

    assert_redirected_to partyrelationships_path
  end
end
