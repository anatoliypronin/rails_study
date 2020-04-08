# frozen_string_literal: true

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "should create review" do
    review = build :review, body: 'Text'
    review.save

    created_review = Review.last
    assert created_review
  end

  test 'should not create review with empty body' do
    review = build :review, body: nil
    review.save

    created_review = Review.last
    assert_not created_review
  end
end
