require 'test_helper'

class StudentHomeworkTest < ActiveSupport::TestCase
  test 'should be create student_homework with student and homework' do
    student_homework = create :student_homework
    assert student_homework.persisted?
  end

  test 'Should create student_homework without link_homework' do
    student_homework = build :student_homework, link_homework: nil
    assert student_homework.save
  end

  test 'Should not create student_homework with invalid link_homework format' do
    student_homework = build :student_homework, link_homework: 'bad link'
    assert_not student_homework.save
  end

  test 'Should not create student_homework without state' do
    student_homework = build :student_homework, state: nil
    assert_not student_homework.save
  end

  test 'Should not create student_homework with invalid state property' do
    student_homework = build :student_homework, state: 'dflk;ld'
    assert_not student_homework.save
  end

  test 'Should change student_homework state to checking' do
    student_homework = create :student_homework
    student_homework.check
    assert_equal 'checking', student_homework.state
  end

  test 'Should change student_homework state to doing from checking' do
    student_homework = create :student_homework
    student_homework.modify
    assert_equal 'doing', student_homework.state
  end

  test 'Should change student_homework state to accepted' do
    student_homework = create :student_homework
    student_homework.check
    student_homework.adopted
    assert_equal 'accepted', student_homework.state
  end

  test 'Should create student_homework without raiting' do
    student_homework = build :student_homework, raiting: nil
    assert student_homework.save
  end

  test 'Should not create student_homework with invalid raiting format' do
    student_homework = build :student_homework, raiting: '123'
    assert_not student_homework.save
  end

  test 'Should not create student_homework with mark not from range' do
    student_homework = build :student_homework, raiting: 7
    assert_not student_homework.save
  end
end
