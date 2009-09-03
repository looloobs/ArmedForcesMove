require 'test_helper'

class OnpostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onpost" do
    assert_difference('Onpost.count') do
      post :create, :onpost => { }
    end

    assert_redirected_to onpost_path(assigns(:onpost))
  end

  test "should show onpost" do
    get :show, :id => onposts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => onposts(:one).to_param
    assert_response :success
  end

  test "should update onpost" do
    put :update, :id => onposts(:one).to_param, :onpost => { }
    assert_redirected_to onpost_path(assigns(:onpost))
  end

  test "should destroy onpost" do
    assert_difference('Onpost.count', -1) do
      delete :destroy, :id => onposts(:one).to_param
    end

    assert_redirected_to onposts_path
  end
end
