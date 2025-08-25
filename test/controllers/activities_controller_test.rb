require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end

  test "should get index" do
    get activities_url, as: :json
    assert_response :success
  end

  test "should create activity" do
    assert_difference("Activity.count") do
      post activities_url, params: { activity: { duration_hours: @activity.duration_hours, name: @activity.name, park_id: @activity.park_id, price_foreign: @activity.price_foreign, price_local: @activity.price_local } }, as: :json
    end

    assert_response :created
  end

  test "should show activity" do
    get activity_url(@activity), as: :json
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: { activity: { duration_hours: @activity.duration_hours, name: @activity.name, park_id: @activity.park_id, price_foreign: @activity.price_foreign, price_local: @activity.price_local } }, as: :json
    assert_response :success
  end

  test "should destroy activity" do
    assert_difference("Activity.count", -1) do
      delete activity_url(@activity), as: :json
    end

    assert_response :no_content
  end
end
