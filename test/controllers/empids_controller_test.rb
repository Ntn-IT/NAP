require "test_helper"

class EmpidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empid = empids(:one)
  end

  test "should get index" do
    get empids_url
    assert_response :success
  end

  test "should get new" do
    get new_empid_url
    assert_response :success
  end

  test "should create empid" do
    assert_difference("Empid.count") do
      post empids_url, params: { empid: { emp_CName: @empid.emp_CName, emp_Department: @empid.emp_Department, emp_FName: @empid.emp_FName, emp_ID: @empid.emp_ID, emp_LName: @empid.emp_LName, emp_M1: @empid.emp_M1, emp_Mat: @empid.emp_Mat, emp_MatHR: @empid.emp_MatHR, emp_PI_ID: @empid.emp_PI_ID, emp_SITEID: @empid.emp_SITEID, emp_Service: @empid.emp_Service } }
    end

    assert_redirected_to empid_url(Empid.last)
  end

  test "should show empid" do
    get empid_url(@empid)
    assert_response :success
  end

  test "should get edit" do
    get edit_empid_url(@empid)
    assert_response :success
  end

  test "should update empid" do
    patch empid_url(@empid), params: { empid: { emp_CName: @empid.emp_CName, emp_Department: @empid.emp_Department, emp_FName: @empid.emp_FName, emp_ID: @empid.emp_ID, emp_LName: @empid.emp_LName, emp_M1: @empid.emp_M1, emp_Mat: @empid.emp_Mat, emp_MatHR: @empid.emp_MatHR, emp_PI_ID: @empid.emp_PI_ID, emp_SITEID: @empid.emp_SITEID, emp_Service: @empid.emp_Service } }
    assert_redirected_to empid_url(@empid)
  end

  test "should destroy empid" do
    assert_difference("Empid.count", -1) do
      delete empid_url(@empid)
    end

    assert_redirected_to empids_url
  end
end
