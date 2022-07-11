require "test_helper"

class TelemedicinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telemedicine = telemedicines(:one)
  end

  test "should get index" do
    get telemedicines_url
    assert_response :success
  end

  test "should get new" do
    get new_telemedicine_url
    assert_response :success
  end

  test "should create telemedicine" do
    assert_difference("Telemedicine.count") do
      post telemedicines_url, params: { telemedicine: {  } }
    end

    assert_redirected_to telemedicine_url(Telemedicine.last)
  end

  test "should show telemedicine" do
    get telemedicine_url(@telemedicine)
    assert_response :success
  end

  test "should get edit" do
    get edit_telemedicine_url(@telemedicine)
    assert_response :success
  end

  test "should update telemedicine" do
    patch telemedicine_url(@telemedicine), params: { telemedicine: {  } }
    assert_redirected_to telemedicine_url(@telemedicine)
  end

  test "should destroy telemedicine" do
    assert_difference("Telemedicine.count", -1) do
      delete telemedicine_url(@telemedicine)
    end

    assert_redirected_to telemedicines_url
  end
end
