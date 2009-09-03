require 'test_helper'

class EatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eat" do
    assert_difference('Eat.count') do
      post :create, :eat => { }
    end

    assert_redirected_to eat_path(assigns(:eat))
  end

  test "should show eat" do
    get :show, :id => eats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => eats(:one).to_param
    assert_response :success
  end

  test "should update eat" do
    put :update, :id => eats(:one).to_param, :eat => { }
    assert_redirected_to eat_path(assigns(:eat))
  end

  test "should destroy eat" do
    assert_difference('Eat.count', -1) do
      delete :destroy, :id => eats(:one).to_param
    end

    assert_redirected_to eats_path
  end
end
