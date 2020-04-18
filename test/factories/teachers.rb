FactoryBot.define do
  factory :teacher do
    first_name
    last_name
    email
    password { '123456' }
    description
  end
end
