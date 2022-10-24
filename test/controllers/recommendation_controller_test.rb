require "test_helper"

class RecommendationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recommendation_new_url
    assert_response :success
  end
end
