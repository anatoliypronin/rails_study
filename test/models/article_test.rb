require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'should create article' do
    article = build :article
    article.save

    created_article = Article.last
    assert created_article
  end

  test 'should not create article with empty title' do
    article = build :article, title: nil
    article.save

    created_article = Article.last
    assert_not created_article
  end

  test 'should unpublish article' do
    article = create :article
    article.unpublish

    assert_equal 'unpublished', article.state
  end
end
