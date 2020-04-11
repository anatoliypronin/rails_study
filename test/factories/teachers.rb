FactoryBot.define do
  factory :teacher do
    first_name
    last_name
    email
    password_digest
    description { 'This is text format very long' }
  end
end
