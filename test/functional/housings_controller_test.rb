require 'test_helper'

class HousingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing" do
    assert_difference('Housing.count') do
      post :create, :housing => { }
    end

    assert_redirected_to housing_path(assigns(:housing))
  end

  test "should show housing" do
    get :show, :id => housings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => housings(:one).to_param
    assert_response :success
  end

  test "should update housing" do
    put :update, :id => housings(:one).to_param, :housing => { }
    assert_redirected_to housing_path(assigns(:housing))
  end

  test "should destroy housing" do
    assert_difference('Housing.count', -1) do
      delete :destroy, :id => housings(:one).to_param
    end

    assert_redirected_to housings_path
  end
end
