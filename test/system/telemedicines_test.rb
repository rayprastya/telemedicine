require "application_system_test_case"

class TelemedicinesTest < ApplicationSystemTestCase
  setup do
    @telemedicine = telemedicines(:one)
  end

  test "visiting the index" do
    visit telemedicines_url
    assert_selector "h1", text: "Telemedicines"
  end

  test "should create telemedicine" do
    visit telemedicines_url
    click_on "New telemedicine"

    click_on "Create Telemedicine"

    assert_text "Telemedicine was successfully created"
    click_on "Back"
  end

  test "should update Telemedicine" do
    visit telemedicine_url(@telemedicine)
    click_on "Edit this telemedicine", match: :first

    click_on "Update Telemedicine"

    assert_text "Telemedicine was successfully updated"
    click_on "Back"
  end

  test "should destroy Telemedicine" do
    visit telemedicine_url(@telemedicine)
    click_on "Destroy this telemedicine", match: :first

    assert_text "Telemedicine was successfully destroyed"
  end
end
