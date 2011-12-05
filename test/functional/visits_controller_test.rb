require 'test_helper'

class VisitsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
  end
  
  test "should get edit" do
    get :edit, :country_id => countries(:one).id
    assert_response :success
  end

  test "should put update" do
    put :update, :country_id => countries(:one).id
    assert_redirected_to country_path(countries(:one))
  end

end
