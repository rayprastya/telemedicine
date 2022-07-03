require "test_helper"

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
  end

  test "should get index" do
    get doctors_url
    assert_response :success
  end

  test "should get new" do
    get new_doctor_url
    assert_response :success
  end

  test "should create doctor" do
    assert_difference("Doctor.count") do
<<<<<<< HEAD
      post doctors_url, params: { doctor: {  } }
=======
      post doctors_url, params: { doctor: { account_id: @doctor.account_id, email: @doctor.email, experience: @doctor.experience, gender: @doctor.gender, name: @doctor.name, no_hp: @doctor.no_hp } }
>>>>>>> 5703ed2535fb91942061211ee2017f110c74b409
    end

    assert_redirected_to doctor_url(Doctor.last)
  end

  test "should show doctor" do
    get doctor_url(@doctor)
    assert_response :success
  end

  test "should get edit" do
    get edit_doctor_url(@doctor)
    assert_response :success
  end

  test "should update doctor" do
<<<<<<< HEAD
    patch doctor_url(@doctor), params: { doctor: {  } }
=======
    patch doctor_url(@doctor), params: { doctor: { account_id: @doctor.account_id, email: @doctor.email, experience: @doctor.experience, gender: @doctor.gender, name: @doctor.name, no_hp: @doctor.no_hp } }
>>>>>>> 5703ed2535fb91942061211ee2017f110c74b409
    assert_redirected_to doctor_url(@doctor)
  end

  test "should destroy doctor" do
    assert_difference("Doctor.count", -1) do
      delete doctor_url(@doctor)
    end

    assert_redirected_to doctors_url
  end
end
