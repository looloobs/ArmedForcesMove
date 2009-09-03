require 'test_helper'

class LearnsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learn" do
    assert_difference('Learn.count') do
      post :create, :learn => { }
    end

    assert_redirected_to learn_path(assigns(:learn))
  end

  test "should show learn" do
    get :show, :id => learns(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => learns(:one).to_param
    assert_response :success
  end

  test "should update learn" do
    put :update, :id => learns(:one).to_param, :learn => { }
    assert_redirected_to learn_path(assigns(:learn))
  end

  test "should destroy learn" do
    assert_difference('Learn.count', -1) do
      delete :destroy, :id => learns(:one).to_param
    end

    assert_redirected_to learns_path
  end
end
