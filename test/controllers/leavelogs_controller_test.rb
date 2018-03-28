require 'test_helper'

class LeavelogsControllerTest < ActionController::TestCase
  setup do
    @leavelog = leavelogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leavelogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leavelog" do
    assert_difference('Leavelog.count') do
      post :create, leavelog: { leave_date_from: @leavelog.leave_date_from, leave_date_to: @leavelog.leave_date_to, reason_for_leave: @leavelog.reason_for_leave, status: @leavelog.status, user_id: @leavelog.user_id }
    end

    assert_redirected_to leavelog_path(assigns(:leavelog))
  end

  test "should show leavelog" do
    get :show, id: @leavelog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leavelog
    assert_response :success
  end

  test "should update leavelog" do
    patch :update, id: @leavelog, leavelog: { leave_date_from: @leavelog.leave_date_from, leave_date_to: @leavelog.leave_date_to, reason_for_leave: @leavelog.reason_for_leave, status: @leavelog.status, user_id: @leavelog.user_id }
    assert_redirected_to leavelog_path(assigns(:leavelog))
  end

  test "should destroy leavelog" do
    assert_difference('Leavelog.count', -1) do
      delete :destroy, id: @leavelog
    end

    assert_redirected_to leavelogs_path
  end
end
