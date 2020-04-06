require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  test "should create teacher" do
    teacher = build :teacher
    teacher.save

    created_teacher = Teacher.last
    assert created_teacher
  end

  test "should not create teacher with no correct email" do
    teacher = build :teacher, email: "roma@eer"
    teacher.save

    created_teacher = Teacher.last
    assert_not created_teacher
  end

  test "should not create teacher with empty first_name" do
    teacher = build :teacher, first_name: nil
    teacher.save

    created_teacher = Teacher.last
    assert_not created_teacher
  end
  
  test "should not create teacher with name lenght > 50" do
    teacher = build :teacher, first_name: "Roma" * 20
    teacher.save

    created_teacher = Teacher.last
    assert_not created_teacher
  end

  test "should not create teacher with not a valid state" do
    teacher = build :teacher, state: "sleep"
    teacher.save

    created_teacher = Teacher.last
    assert_not created_teacher
  end
end
