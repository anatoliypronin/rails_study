FactoryBot.define do
  sequence :string, aliases: %i[first_name last_name password_digest description] do |n|
    "String#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  sequence :phone_number do |n|
    "7927111222#{n}"
  end
end
