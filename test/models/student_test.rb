# frozen_string_literal: true

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
    student = build :student, email: '1234567'
    assert_not student.save
  end

  test 'phone_number should be unique' do
    first_student = build :student, phone_number: '+77777777777'
    first_student.save

    second_student = build :student, phone_number: '+77777777777'
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
end
