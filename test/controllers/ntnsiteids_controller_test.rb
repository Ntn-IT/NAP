require "test_helper"

class NtnsiteidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ntnsiteid = ntnsiteids(:one)
  end

  test "should get index" do
    get ntnsiteids_url
    assert_response :success
  end

  test "should get new" do
    get new_ntnsiteid_url
    assert_response :success
  end

  test "should create ntnsiteid" do
    assert_difference("Ntnsiteid.count") do
      post ntnsiteids_url, params: { ntnsiteid: { site_Country: @ntnsiteid.site_Country, site_ID: @ntnsiteid.site_ID, site_NStreet: @ntnsiteid.site_NStreet, site_Postal: @ntnsiteid.site_Postal, site_Region: @ntnsiteid.site_Region, site_Street: @ntnsiteid.site_Street, site_Town: @ntnsiteid.site_Town } }
    end

    assert_redirected_to ntnsiteid_url(Ntnsiteid.last)
  end

  test "should show ntnsiteid" do
    get ntnsiteid_url(@ntnsiteid)
    assert_response :success
  end

  test "should get edit" do
    get edit_ntnsiteid_url(@ntnsiteid)
    assert_response :success
  end

  test "should update ntnsiteid" do
    patch ntnsiteid_url(@ntnsiteid), params: { ntnsiteid: { site_Country: @ntnsiteid.site_Country, site_ID: @ntnsiteid.site_ID, site_NStreet: @ntnsiteid.site_NStreet, site_Postal: @ntnsiteid.site_Postal, site_Region: @ntnsiteid.site_Region, site_Street: @ntnsiteid.site_Street, site_Town: @ntnsiteid.site_Town } }
    assert_redirected_to ntnsiteid_url(@ntnsiteid)
  end

  test "should destroy ntnsiteid" do
    assert_difference("Ntnsiteid.count", -1) do
      delete ntnsiteid_url(@ntnsiteid)
    end

    assert_redirected_to ntnsiteids_url
  end
end
