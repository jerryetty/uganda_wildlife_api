require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
  end

  test "should get index" do
    get bookings_url, as: :json
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { activity_id: @booking.activity_id, email: @booking.email, number_of_visitors: @booking.number_of_visitors, phone: @booking.phone, status: @booking.status, user_id: @booking.user_id, visit_date: @booking.visit_date, visitor_name: @booking.visitor_name } }, as: :json
    end

    assert_response :created
  end

  test "should show booking" do
    get booking_url(@booking), as: :json
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { activity_id: @booking.activity_id, email: @booking.email, number_of_visitors: @booking.number_of_visitors, phone: @booking.phone, status: @booking.status, user_id: @booking.user_id, visit_date: @booking.visit_date, visitor_name: @booking.visitor_name } }, as: :json
    assert_response :success
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking), as: :json
    end

    assert_response :no_content
  end
end
