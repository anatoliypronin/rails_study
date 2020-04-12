FactoryBot.define do
  factory :student_course do
    student
    course
    completed { false }
  end
end
