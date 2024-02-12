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
      post empids_url, params: { empid: { emp_cn: @empid.emp_cn, emp_fn: @empid.emp_fn, emp_function: @empid.emp_function, emp_grp: @empid.emp_grp, emp_id: @empid.emp_id, emp_ln: @empid.emp_ln, emp_m1: @empid.emp_m1, emp_m2: @empid.emp_m2, emp_m3: @empid.emp_m3, emp_m4: @empid.emp_m4, emp_m5: @empid.emp_m5, emp_mat: @empid.emp_mat, emp_mat_hr: @empid.emp_mat_hr, emp_pi_id: @empid.emp_pi_id, emp_pole: @empid.emp_pole, emp_service: @empid.emp_service, emp_status: @empid.emp_status } }
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
    patch empid_url(@empid), params: { empid: { emp_cn: @empid.emp_cn, emp_fn: @empid.emp_fn, emp_function: @empid.emp_function, emp_grp: @empid.emp_grp, emp_id: @empid.emp_id, emp_ln: @empid.emp_ln, emp_m1: @empid.emp_m1, emp_m2: @empid.emp_m2, emp_m3: @empid.emp_m3, emp_m4: @empid.emp_m4, emp_m5: @empid.emp_m5, emp_mat: @empid.emp_mat, emp_mat_hr: @empid.emp_mat_hr, emp_pi_id: @empid.emp_pi_id, emp_pole: @empid.emp_pole, emp_service: @empid.emp_service, emp_status: @empid.emp_status } }
    assert_redirected_to empid_url(@empid)
  end

  test "should destroy empid" do
    assert_difference("Empid.count", -1) do
      delete empid_url(@empid)
    end

    assert_redirected_to empids_url
  end
end
