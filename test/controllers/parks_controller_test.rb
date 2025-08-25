require "test_helper"

class ParksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @park = parks(:one)
  end

  test "should get index" do
    get parks_url, as: :json
    assert_response :success
  end

  test "should create park" do
    assert_difference("Park.count") do
      post parks_url, params: { park: { entrance_fee_foreign: @park.entrance_fee_foreign, entrance_fee_local: @park.entrance_fee_local, name: @park.name } }, as: :json
    end

    assert_response :created
  end

  test "should show park" do
    get park_url(@park), as: :json
    assert_response :success
  end

  test "should update park" do
    patch park_url(@park), params: { park: { entrance_fee_foreign: @park.entrance_fee_foreign, entrance_fee_local: @park.entrance_fee_local, name: @park.name } }, as: :json
    assert_response :success
  end

  test "should destroy park" do
    assert_difference("Park.count", -1) do
      delete park_url(@park), as: :json
    end

    assert_response :no_content
  end
end
