# frozen_string_literal: true

FactoryBot.define do
  factory :student do
    first_name { 'Alex' }
    last_name { 'Ryabchikov' }
    email { 'ar@gmail.com' }
    phone_number { '+79276322727' }
    state { 'active' }
  end
end
