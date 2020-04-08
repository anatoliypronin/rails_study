# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    name { 'name' }
    email { 'admin@gmail.com' }
    password_digest { 'password' }
    role { 'admin' }
    state { 'active' }
  end
end
