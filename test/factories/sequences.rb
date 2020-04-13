FactoryBot.define do
  sequence :string, aliases: %i[first_name last_name password_digest description name] do |n|
    "String#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end

  sequence :phone_number do
    "7927#{rand(10**6..10**7)}" 
  end
end
