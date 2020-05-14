require "test_helper"

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = create :article
  end

  test "should get index articles page" do
    get articles_path
    assert_response :success
  end

  test "should get show article page" do
    get article_path(@article.id)
    assert_response :success
  end
end
