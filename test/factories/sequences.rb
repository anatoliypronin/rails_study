FactoryBot.define do
  sequence :string, aliases: %i[first_name last_name password_digest description name title body student_comment teacher_comment] do |n|
    "String#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  sequence :phone_number do
    "7927#{rand(10**6..10**7)}"
  end

  sequence :raiting do
    (rand 1..5)
  end

  sequence :link_homework do |n|
    "https://github.com/test#{n}"
  end

  sequence :datetime, aliases: %i[date_begin date_end] do |_n|
    DateTime.new
  end
end