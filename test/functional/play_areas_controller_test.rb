require 'test_helper'

class PlayAreasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_area" do
    assert_difference('PlayArea.count') do
      post :create, :play_area => { }
    end

    assert_redirected_to play_area_path(assigns(:play_area))
  end

  test "should show play_area" do
    get :show, :id => play_areas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => play_areas(:one).to_param
    assert_response :success
  end

  test "should update play_area" do
    put :update, :id => play_areas(:one).to_param, :play_area => { }
    assert_redirected_to play_area_path(assigns(:play_area))
  end

  test "should destroy play_area" do
    assert_difference('PlayArea.count', -1) do
      delete :destroy, :id => play_areas(:one).to_param
    end

    assert_redirected_to play_areas_path
  end
end
