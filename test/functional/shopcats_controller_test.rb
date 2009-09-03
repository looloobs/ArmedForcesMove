require 'test_helper'

class ShopcatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopcats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopcat" do
    assert_difference('Shopcat.count') do
      post :create, :shopcat => { }
    end

    assert_redirected_to shopcat_path(assigns(:shopcat))
  end

  test "should show shopcat" do
    get :show, :id => shopcats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shopcats(:one).to_param
    assert_response :success
  end

  test "should update shopcat" do
    put :update, :id => shopcats(:one).to_param, :shopcat => { }
    assert_redirected_to shopcat_path(assigns(:shopcat))
  end

  test "should destroy shopcat" do
    assert_difference('Shopcat.count', -1) do
      delete :destroy, :id => shopcats(:one).to_param
    end

    assert_redirected_to shopcats_path
  end
end
