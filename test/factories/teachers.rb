# frozen_string_literal: true

FactoryBot.define do
  factory :teacher do
    first_name { 'Roma' }
    last_name { 'Salikov' }
    email { 'roma.salikov@yandex.ru' }
    password_digest { '312kh312ui3g1' }
    description { 'This is text format very long' }
    state { 'active' }
  end
end
