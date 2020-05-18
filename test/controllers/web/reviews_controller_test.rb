require 'test_helper'

class Web::ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = create :review
  end

  test 'should get index review page' do
    get reviews_path
    assert_response :success
  end
end
