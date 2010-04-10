require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post :create, :budget => { }
    end

    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should show budget" do
    get :show, :id => budgets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => budgets(:one).to_param
    assert_response :success
  end

  test "should update budget" do
    put :update, :id => budgets(:one).to_param, :budget => { }
    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete :destroy, :id => budgets(:one).to_param
    end

    assert_redirected_to budgets_path
  end
end
