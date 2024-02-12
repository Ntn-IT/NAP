require "application_system_test_case"

class NtnsiteidsTest < ApplicationSystemTestCase
  setup do
    @ntnsiteid = ntnsiteids(:one)
  end

  test "visiting the index" do
    visit ntnsiteids_url
    assert_selector "h1", text: "Ntnsiteids"
  end

  test "should create ntnsiteid" do
    visit ntnsiteids_url
    click_on "New ntnsiteid"

    fill_in "Site country", with: @ntnsiteid.site_Country
    fill_in "Site id", with: @ntnsiteid.site_ID
    fill_in "Site nstreet", with: @ntnsiteid.site_NStreet
    fill_in "Site postal", with: @ntnsiteid.site_Postal
    fill_in "Site region", with: @ntnsiteid.site_Region
    fill_in "Site street", with: @ntnsiteid.site_Street
    fill_in "Site town", with: @ntnsiteid.site_Town
    click_on "Create Ntnsiteid"

    assert_text "Ntnsiteid was successfully created"
    click_on "Back"
  end

  test "should update Ntnsiteid" do
    visit ntnsiteid_url(@ntnsiteid)
    click_on "Edit this ntnsiteid", match: :first

    fill_in "Site country", with: @ntnsiteid.site_Country
    fill_in "Site id", with: @ntnsiteid.site_ID
    fill_in "Site nstreet", with: @ntnsiteid.site_NStreet
    fill_in "Site postal", with: @ntnsiteid.site_Postal
    fill_in "Site region", with: @ntnsiteid.site_Region
    fill_in "Site street", with: @ntnsiteid.site_Street
    fill_in "Site town", with: @ntnsiteid.site_Town
    click_on "Update Ntnsiteid"

    assert_text "Ntnsiteid was successfully updated"
    click_on "Back"
  end

  test "should destroy Ntnsiteid" do
    visit ntnsiteid_url(@ntnsiteid)
    click_on "Destroy this ntnsiteid", match: :first

    assert_text "Ntnsiteid was successfully destroyed"
  end
end
