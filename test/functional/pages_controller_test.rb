require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get controlpanel" do
    get :controlpanel
    assert_response :success
  end

end
