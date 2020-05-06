require 'test_helper'

class Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = create :article
    admin = create :admin
    sign_in_as_admin(admin)
  end

  test 'should get index articles page' do
    get admin_articles_path
    assert_response :success
  end

  test 'should get new article page' do
    get new_admin_article_path
    assert_response :success
  end

  test 'should post create article' do
    article_attrs = attributes_for :article

    post admin_articles_path, params: { article: article_attrs }
    assert_response :redirect

    article = Article.last
    assert_equal article_attrs[:body], article.body
  end

  test 'should not post create article' do
    article_attrs = attributes_for :article, body: nil

    post admin_articles_path, params: { article: article_attrs }
    assert_response :success

    article = Article.find_by(body: article_attrs[:body])
    assert_nil article
  end

  test 'should get show article page' do
    get admin_article_path(@article.id)
    assert_response :success
  end

  test 'should get edit article page' do
    get edit_admin_article_path(@article.id)
    assert_response :success
  end

  test 'should put update article' do
    attrs = {}
    attrs[:title] = generate :title
    attrs[:body] = '123456'

    put admin_article_path(@article.id), params: { article: attrs }
    assert_response :redirect

    @article.reload
    assert_equal attrs[:title], @article.title
  end

  test 'should state unpublish article' do
    put admin_article_unpublish_path(@article)
    assert_response :redirect

    @article.reload
    assert_equal 'unpublished', @article.state
  end

  test 'should state publish article' do
    @article = create :article, :unpublish
    put admin_article_publish_path(@article.id)
    assert_response :redirect

    @article.reload
    assert_equal 'published', @article.state
  end
end
