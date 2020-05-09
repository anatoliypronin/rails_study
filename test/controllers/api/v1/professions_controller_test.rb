require 'test_helper'

class Api::V1::ProfessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profession = create :profession
  end

  test 'should get professions list' do
    get api_v1_professions_path
    assert_response :success
  end

  test 'should get profession info' do
    get api_v1_profession_path(@profession)
    assert_response :success

    assert_equal response.parsed_body['title'], @profession.title
    assert_equal response.parsed_body['description'], @profession.description
  end
end
