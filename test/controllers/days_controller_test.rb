require "test_helper"

class DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:one)
  end

  test "should get index" do
    get days_url, as: :json
    assert_response :success
  end

  test "should create day" do
    assert_difference("Day.count") do
      post days_url, params: { day: { date: @day.date } }, as: :json
    end

    assert_response :created
  end

  test "should show day" do
    get day_url(@day), as: :json
    assert_response :success
  end

  test "should update day" do
    patch day_url(@day), params: { day: { date: @day.date } }, as: :json
    assert_response :success
  end

  test "should destroy day" do
    assert_difference("Day.count", -1) do
      delete day_url(@day), as: :json
    end

    assert_response :no_content
  end
end
