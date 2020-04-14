require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test 'should be create review with student and course' do
    review = create :review
    assert review
  end
end
