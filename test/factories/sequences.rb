FactoryBot.define do
  sequence :string, aliases: %i[first_name last_name password_digest description name] do |n|
    "String#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end
end
