# frozen_string_literal: true

require 'test_helper'

class SiteidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @siteid = siteids(:one)
  end

  test 'should get index' do
    get siteids_url
    assert_response :success
  end

  test 'should get new' do
    get new_siteid_url
    assert_response :success
  end

  test 'should create siteid' do
    assert_difference('Siteid.count') do
      post siteids_url,
           params: { siteid: { site_Country: @siteid.site_Country, site_ID: @siteid.site_ID, site_NStreet: @siteid.site_NStreet,
                               site_Postal: @siteid.site_Postal, site_Region: @siteid.site_Region, site_Street: @siteid.site_Street, site_Town: @siteid.site_Town } }
    end

    assert_redirected_to siteid_url(Siteid.last)
  end

  test 'should show siteid' do
    get siteid_url(@siteid)
    assert_response :success
  end

  test 'should get edit' do
    get edit_siteid_url(@siteid)
    assert_response :success
  end

  test 'should update siteid' do
    patch siteid_url(@siteid),
          params: { siteid: { site_Country: @siteid.site_Country, site_ID: @siteid.site_ID, site_NStreet: @siteid.site_NStreet,
                              site_Postal: @siteid.site_Postal, site_Region: @siteid.site_Region, site_Street: @siteid.site_Street, site_Town: @siteid.site_Town } }
    assert_redirected_to siteid_url(@siteid)
  end

  test 'should destroy siteid' do
    assert_difference('Siteid.count', -1) do
      delete siteid_url(@siteid)
    end

    assert_redirected_to siteids_url
  end
end
