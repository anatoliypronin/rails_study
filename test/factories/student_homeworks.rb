FactoryBot.define do
  factory :student_homework do
    student
    # lesson
    raiting
    student_comment
    teacher_comment
    date_begin
    date_end
    link_homework
  end
end