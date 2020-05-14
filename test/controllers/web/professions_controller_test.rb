require "test_helper"

class Web::ProfessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profession = create :profession
  end

  test "should get index profession page" do
    get professions_path
    assert_response :success
  end

  test "should get show profession page" do
    get profession_path(@profession.id)
    assert_response :success
  end
end
