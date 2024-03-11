# frozen_string_literal: true

require 'test_helper'

class PersonnesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personne = personnes(:one)
  end

  test 'should get index' do
    get personnes_url
    assert_response :success
  end

  test 'should get new' do
    get new_personne_url
    assert_response :success
  end

  test 'should create personne' do
    assert_difference('personne.count') do
      post personnes_url,
           params: { personne: { cname: @personne.cname, department: @personne.department, fname: @personne.fname,
                                 lname: @personne.lname, m1: @personne.m1, matsnr: @personne.matsnr, mathr: @personne.mathr, siteid: @personne.siteid, service: @personne.service } }
    end

    assert_redirected_to personne_url(personne.last)
  end

  test 'should show personne' do
    get personne_url(@personne)
    assert_response :success
  end

  test 'should get edit' do
    get edit_personne_url(@personne)
    assert_response :success
  end

  test 'should update personne' do
    patch personne_url(@personne),
          params: { personne: { cname: @personne.cname, department: @personne.department, fname: @personne.fname,
                                lname: @personne.lname, m1: @personne.m1, matsnr: @personne.matsnr, mathr: @personne.mathr, siteid: @personne.siteid, service: @personne.service } }
    assert_redirected_to personne_url(@personne)
  end

  test 'should destroy personne' do
    assert_difference('personne.count', -1) do
      delete personne_url(@personne)
    end

    assert_redirected_to personnes_url
  end
end
