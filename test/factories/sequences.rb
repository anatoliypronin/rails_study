FactoryBot.define do
  sequence :string, aliases: %i[first_name last_name password_digest] do |n|
    "String#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  sequence :description do
    "Text"
  end
end
