require 'test_helper'

class OffpostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offpost" do
    assert_difference('Offpost.count') do
      post :create, :offpost => { }
    end

    assert_redirected_to offpost_path(assigns(:offpost))
  end

  test "should show offpost" do
    get :show, :id => offposts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => offposts(:one).to_param
    assert_response :success
  end

  test "should update offpost" do
    put :update, :id => offposts(:one).to_param, :offpost => { }
    assert_redirected_to offpost_path(assigns(:offpost))
  end

  test "should destroy offpost" do
    assert_difference('Offpost.count', -1) do
      delete :destroy, :id => offposts(:one).to_param
    end

    assert_redirected_to offposts_path
  end
end
