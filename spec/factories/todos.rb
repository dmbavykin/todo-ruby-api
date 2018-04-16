# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    content { FFaker::Book.title }
    order { rand(1..10) }
    is_done { false }
    expiration_date { FFaker::Time.between(Time.now, 2.months.ago) }
    project
  end
end
