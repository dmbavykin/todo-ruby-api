FactoryBot.define do
  factory :comment do
    content { FFaker::Book.title }
    todo
  end
end
