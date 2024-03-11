# frozen_string_literal: true

require 'application_system_test_case'

module Admin
  class SiteidsTest < ApplicationSystemTestCase
    setup do
      @admin_siteid = admin_siteids(:one)
    end

    test 'visiting the index' do
      visit admin_siteids_url
      assert_selector 'h1', text: 'Siteids'
    end

    test 'should create siteid' do
      visit admin_siteids_url
      click_on 'New siteid'

      fill_in 'Site country', with: @admin_siteid.site_Country
      fill_in 'Site id', with: @admin_siteid.site_ID
      fill_in 'Site nstreet', with: @admin_siteid.site_NStreet
      fill_in 'Site postal', with: @admin_siteid.site_Postal
      fill_in 'Site region', with: @admin_siteid.site_Region
      fill_in 'Site street', with: @admin_siteid.site_Street
      fill_in 'Site town', with: @admin_siteid.site_Town
      click_on 'Create Siteid'

      assert_text 'Siteid was successfully created'
      click_on 'Back'
    end

    test 'should update Siteid' do
      visit admin_siteid_url(@admin_siteid)
      click_on 'Edit this siteid', match: :first

      fill_in 'Site country', with: @admin_siteid.site_Country
      fill_in 'Site id', with: @admin_siteid.site_ID
      fill_in 'Site nstreet', with: @admin_siteid.site_NStreet
      fill_in 'Site postal', with: @admin_siteid.site_Postal
      fill_in 'Site region', with: @admin_siteid.site_Region
      fill_in 'Site street', with: @admin_siteid.site_Street
      fill_in 'Site town', with: @admin_siteid.site_Town
      click_on 'Update Siteid'

      assert_text 'Siteid was successfully updated'
      click_on 'Back'
    end

    test 'should destroy Siteid' do
      visit admin_siteid_url(@admin_siteid)
      click_on 'Destroy this siteid', match: :first

      assert_text 'Siteid was successfully destroyed'
    end
  end
end
