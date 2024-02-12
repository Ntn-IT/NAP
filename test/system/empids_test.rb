require "application_system_test_case"

class EmpidsTest < ApplicationSystemTestCase
  setup do
    @empid = empids(:one)
  end

  test "visiting the index" do
    visit empids_url
    assert_selector "h1", text: "Empids"
  end

  test "should create empid" do
    visit empids_url
    click_on "New empid"

    fill_in "Emp cn", with: @empid.emp_cn
    fill_in "Emp fn", with: @empid.emp_fn
    fill_in "Emp function", with: @empid.emp_function
    fill_in "Emp grp", with: @empid.emp_grp
    fill_in "Emp", with: @empid.emp_id
    fill_in "Emp ln", with: @empid.emp_ln
    fill_in "Emp m1", with: @empid.emp_m1
    fill_in "Emp m2", with: @empid.emp_m2
    fill_in "Emp m3", with: @empid.emp_m3
    fill_in "Emp m4", with: @empid.emp_m4
    fill_in "Emp m5", with: @empid.emp_m5
    fill_in "Emp mat", with: @empid.emp_mat
    fill_in "Emp mat hr", with: @empid.emp_mat_hr
    fill_in "Emp pi", with: @empid.emp_pi_id
    fill_in "Emp pole", with: @empid.emp_pole
    fill_in "Emp service", with: @empid.emp_service
    fill_in "Emp status", with: @empid.emp_status
    click_on "Create Empid"

    assert_text "Empid was successfully created"
    click_on "Back"
  end

  test "should update Empid" do
    visit empid_url(@empid)
    click_on "Edit this empid", match: :first

    fill_in "Emp cn", with: @empid.emp_cn
    fill_in "Emp fn", with: @empid.emp_fn
    fill_in "Emp function", with: @empid.emp_function
    fill_in "Emp grp", with: @empid.emp_grp
    fill_in "Emp", with: @empid.emp_id
    fill_in "Emp ln", with: @empid.emp_ln
    fill_in "Emp m1", with: @empid.emp_m1
    fill_in "Emp m2", with: @empid.emp_m2
    fill_in "Emp m3", with: @empid.emp_m3
    fill_in "Emp m4", with: @empid.emp_m4
    fill_in "Emp m5", with: @empid.emp_m5
    fill_in "Emp mat", with: @empid.emp_mat
    fill_in "Emp mat hr", with: @empid.emp_mat_hr
    fill_in "Emp pi", with: @empid.emp_pi_id
    fill_in "Emp pole", with: @empid.emp_pole
    fill_in "Emp service", with: @empid.emp_service
    fill_in "Emp status", with: @empid.emp_status
    click_on "Update Empid"

    assert_text "Empid was successfully updated"
    click_on "Back"
  end

  test "should destroy Empid" do
    visit empid_url(@empid)
    click_on "Destroy this empid", match: :first

    assert_text "Empid was successfully destroyed"
  end
end
