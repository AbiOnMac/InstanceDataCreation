FactoryBot.define do
  factory :enrollment do
    association :user
    association :student
    association :course
  end
end
