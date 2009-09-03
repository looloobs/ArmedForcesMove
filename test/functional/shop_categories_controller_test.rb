require 'test_helper'

class ShopCategoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_category" do
    assert_difference('ShopCategory.count') do
      post :create, :shop_category => { }
    end

    assert_redirected_to shop_category_path(assigns(:shop_category))
  end

  test "should show shop_category" do
    get :show, :id => shop_categories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => shop_categories(:one).to_param
    assert_response :success
  end

  test "should update shop_category" do
    put :update, :id => shop_categories(:one).to_param, :shop_category => { }
    assert_redirected_to shop_category_path(assigns(:shop_category))
  end

  test "should destroy shop_category" do
    assert_difference('ShopCategory.count', -1) do
      delete :destroy, :id => shop_categories(:one).to_param
    end

    assert_redirected_to shop_categories_path
  end
end
