# frozen_string_literal: true

require 'test_helper'

class EntretiensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entretien = entretiens(:one)
  end

  test 'should get index' do
    get entretiens_url
    assert_response :success
  end

  test 'should get new' do
    get new_entretien_url
    assert_response :success
  end

  test 'should create entretien' do
    assert_difference('entretien.count') do
      post entretiens_url,
           params: { entretien: { entretien_M1: @entretien.entretien_M1, entretien_Obj1: @entretien.entretien_Obj1, entretien_Obj2: @entretien.entretien_Obj2, entretien_Obj3: @entretien.entretien_Obj3,
                                  entretien_mat: @entretien.entretien_mat } }
    end

    assert_redirected_to entretien_url(entretien.last)
  end

  test 'should show entretien' do
    get entretien_url(@entretien)
    assert_response :success
  end

  test 'should get edit' do
    get edit_entretien_url(@entretien)
    assert_response :success
  end

  test 'should update entretien' do
    patch entretien_url(@entretien),
          params: { entretien: { entretien_M1: @entretien.entretien_M1, entretien_Obj1: @entretien.entretien_Obj1, entretien_Obj2: @entretien.entretien_Obj2, entretien_Obj3: @entretien.entretien_Obj3,
                                 entretien_mat: @entretien.entretien_mat } }
    assert_redirected_to entretien_url(@entretien)
  end

  test 'should destroy entretien' do
    assert_difference('entretien.count', -1) do
      delete entretien_url(@entretien)
    end

    assert_redirected_to entretiens_url
  end
end
