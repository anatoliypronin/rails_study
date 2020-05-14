require 'test_helper'

class Web::Teacher::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = create :article
    teacher = create :teacher
    sign_in_as_teacher(teacher)
  end

  test 'should get index articles page' do
    get teacher_articles_path
    assert_response :success
  end

  test 'should get new article page' do
    get new_teacher_article_path
    assert_response :success
  end

  test 'should post create article' do
    article_attrs = attributes_for :article

    post teacher_articles_path, params: { article: article_attrs }
    assert_response :redirect

    article = Article.last
    assert_equal article_attrs[:body], article.body
  end

  test 'should not post create article' do
    article_attrs = attributes_for :article, body: nil

    post teacher_articles_path, params: { article: article_attrs }
    assert_response :success

    article = Article.find_by(body: article_attrs[:body])
    assert_nil article
  end

  test 'should get show article page' do
    get teacher_article_path(@article.id)
    assert_response :success
  end

  test 'should get edit article page' do
    get edit_teacher_article_path(@article.id)
    assert_response :success
  end

  test 'should put update article' do
    attrs = {}
    attrs[:title] = generate :title
    attrs[:body] = '123456'

    put teacher_article_path(@article.id), params: { article: attrs }
    assert_response :redirect

    @article.reload
    assert_equal attrs[:title], @article.title
    assert_equal attrs[:body], @article.body
  end

  test 'should state unpublish article' do
    put teacher_article_unpublish_path(@article)
    assert_response :redirect

    @article.reload
    assert_equal 'unpublished', @article.state
  end

  test 'should state publish article' do
    @article = create :article, :unpublished
    put teacher_article_publish_path(@article.id)
    assert_response :redirect

    @article.reload
    assert_equal 'published', @article.state
  end
end
