require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test 'should create student' do
    student = build :student
    student.save

    created_student = Student.last
    assert created_student
  end

  test 'should not create student with empty phone_number' do
    student = build :student, phone_number: nil
    student.save

    created_student = Student.last
    assert_not created_student
  end

  test 'phone_number should be valid' do
    student = build :student, phone_number: '1234567'
    assert_not student.save

    student = build :student, phone_number: '8927-222-2222'
    assert_not student.save

    student = build :student, phone_number: '+7927-222-222'
    assert_not student.save

    student = build :student, phone_number: '89272221133'
    assert_not student.save

    student = build :student, phone_number: '+19272221133'
    assert_not student.save

    student = build :student, phone_number: '++9272221133'
    assert_not student.save

    student = build :student, phone_number: '+79271112233'
    assert student.save

    student = build :student, phone_number: '+79271112244'
    assert student.save

    student = build :student, phone_number: '+14044904571'
    assert student.save

    student = build :student, phone_number: '79271112244'
    assert student.save
  end

  test 'phone_number should be unique' do
    first_student = build :student, phone_number: '+9271112233'
    first_student.save

    second_student = build :student, phone_number: '+9271112233'
    assert_not second_student.save
  end

  test 'email should be valid' do
    student = build :student, email: 'admin_admin_admin'
    assert_not student.save
  end

  test 'should not create incorrect state' do
    student = build :student, state: 'any state'
    assert student.invalid?
  end

  test 'should del student' do
    student = create :student
    student.del
    assert_equal 'deleted', student.state
  end
end
