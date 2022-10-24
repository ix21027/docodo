require "test_helper"

class SpecialtiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get specialties_index_url
    assert_response :success
  end
end
