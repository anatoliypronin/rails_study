require 'test_helper'

class CourseProfessionTest < ActiveSupport::TestCase
  test 'should be create course_profession with course and profession' do
    course_profession = create :course_profession
    assert course_profession.persisted?
  end
end
