require 'test_helper'

class PlayCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_category" do
    assert_difference('PlayCategory.count') do
      post :create, :play_category => { }
    end

    assert_redirected_to play_category_path(assigns(:play_category))
  end

  test "should show play_category" do
    get :show, :id => play_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => play_categories(:one).to_param
    assert_response :success
  end

  test "should update play_category" do
    put :update, :id => play_categories(:one).to_param, :play_category => { }
    assert_redirected_to play_category_path(assigns(:play_category))
  end

  test "should destroy play_category" do
    assert_difference('PlayCategory.count', -1) do
      delete :destroy, :id => play_categories(:one).to_param
    end

    assert_redirected_to play_categories_path
  end
end
